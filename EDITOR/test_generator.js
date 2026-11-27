/* node test_generator.js [outdir]: generate the default C1616, have kicad-cli load it, check the netlist. */
const fs = require('fs'), path = require('path'), { execFileSync } = require('child_process');
const EC = require('./generator.js');
const out = process.argv[2] || path.join(__dirname, 'test-out');
fs.rmSync(out, { recursive: true, force: true }); fs.mkdirSync(out, { recursive: true });

const cfg = EC.defaultConfig();
if (process.env.ALT) {                     // a second configuration: every slot type, no M480B
  cfg.inputs = 8; cfg.inputModule = false;
  cfg.rows = [['SUM', 'SUM', 'PATCH', 'EQ', 'COMP', 'BIGVU'], ['SUM', 'SUM', 'INSERT', 'DEESS', 'GATE', 'EMPTY']];
}
const design = EC.build(cfg), files = EC.serialize(design);
for (const [n, t] of Object.entries(files)) fs.writeFileSync(path.join(out, n), t);
console.log(design.name, Object.keys(files).length, 'files', design.bom);

const root = path.join(out, design.name + '.kicad_sch'), net = path.join(out, design.name + '.net');
execFileSync('kicad-cli', ['sch', 'export', 'netlist', '--format', 'kicadsexpr', '-o', net, root], { stdio: 'inherit' });
const N = fs.readFileSync(net, 'utf8');
const nets = {};
for (const m of N.matchAll(/\(net \(code "?\d+"?\) \(name "([^"]+)"[^]*?(?=\(net \(code|\)\s*\)\s*$)/g)) {
  nets[m[1]] = [...m[0].matchAll(/\(node \(ref "([^"]+)"\) \(pin "([^"]+)"/g)].map(x => x[1] + '.' + x[2]);
}
const get = n => nets['/' + n] || nets[n] || [];
let bad = 0;
const expect = (n, cond, msg) => { const v = get(n); const ok = cond(v); if (!ok) bad++; console.log(ok ? 'ok  ' : 'BAD ', n.padEnd(10), v.length, 'nodes', msg, ok ? '' : JSON.stringify(v.slice(0, 40))); };
const nIn = cfg.inputs;
expect('SUMN01+', v => v.length === (cfg.resistors ? nIn + 1 : 1), `= ${nIn} resistors + M450 summing input`);
expect('CH01+', v => v.length >= 1 + design.buses + cfg.rows.length, `= channel out + ${design.buses} resistors + QTP pins`);
expect('BUS01+', v => v.length >= 2, '= bus driver + meter / QTP out');
expect('IN01+', v => v.length === (cfg.inputModule ? 2 : 2), '= XLR + input');
expect('GND', v => v.length > 10, 'power');
console.log(Object.keys(nets).length, 'nets');
try { execFileSync('kicad-cli', ['sch', 'erc', '-o', path.join(out, 'erc.rpt'), root], { stdio: 'pipe' }); } catch (e) { }
const erc = fs.existsSync(path.join(out, 'erc.rpt')) ? fs.readFileSync(path.join(out, 'erc.rpt'), 'utf8') : '';
const kinds = {}; for (const m of erc.matchAll(/^\[(\w+)\]/gm)) kinds[m[1]] = (kinds[m[1]] || 0) + 1;
console.log('ERC', kinds);
process.exit(bad ? 1 : 0);
