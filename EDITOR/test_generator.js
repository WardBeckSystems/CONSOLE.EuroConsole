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
if (process.env.ALT) { cfg.template = { in: 'DIRECT', fx: ['GATE', 'EQ', 'COMP', 'DEESS'], sends: ['M14'] }; cfg.channels = [null, { in: 'LINE', fx: [], sends: [] }]; }
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
const CHS = EC.channels(cfg), B = design.buses;
if (process.env.ALT) for (const c of CHS) { /* ALT: no sends */ }
// send buses: summed inside the send banks, cascading bank to bank (no summing point over 5 inputs)
const sb = B.find(b => b.send);
if (sb) {
  const banksWith = [...new Set(CHS.map((c, i) => c.sends.includes(sb.send) ? Math.floor(i / 4) : -1).filter(x => x >= 0))];
  if (banksWith.length > 1) expect(`${sb.name}_B${banksWith[0] + 1}+`, v => v.length === 3, '= send bank out -> next bank in + bus QTP');
  expect(`${sb.name}_SUM+`, v => v.length >= 3, '= last send bank out -> master + QTP');
  expect(`SUMN_${sb.name}+`, v => v.length === 0, '= no summing amp for a send bus');
}
for (const b of B.filter(b => !b.send)) {
  const n = cfg.inputs, k = n > 8 ? Math.ceil(n / 8) : n;
  expect(`SUMN_${b.name}+`, v => v.length === (cfg.resistors ? k + 1 : 1), '= direct sum (groups of 8)');
}
expect('IN01+', v => v.length === 2, '= XLR + preamp / first stage');
expect('CH01+', v => v.length >= 2, '= channel out + sends / QTP');
const k0 = CHS[0].fx[0];
if (k0) expect(`${k0}01+`, v => v.length === 2, `= ${k0} out -> next stage`);
if (cfg.rows.some(r => r.includes('FADER'))) { expect('M1_INSERT+', v => v.length === 2, '= M499 out -> M466 comp in'); expect('M1_COMP+', v => v.length === 2, '= M466 out -> fader in'); expect('M1+', v => v.length >= 2, '= master fader out -> Big VU / QTP'); }
expect('GND', v => v.length > 10, 'power');
console.log(Object.keys(nets).length, 'nets');
try { execFileSync('kicad-cli', ['sch', 'erc', '-o', path.join(out, 'erc.rpt'), root], { stdio: 'pipe' }); } catch (e) { }
const erc = fs.existsSync(path.join(out, 'erc.rpt')) ? fs.readFileSync(path.join(out, 'erc.rpt'), 'utf8') : '';
const kinds = {}; for (const m of erc.matchAll(/^\[(\w+)\]/gm)) kinds[m[1]] = (kinds[m[1]] || 0) + 1;
console.log('ERC', kinds);
process.exit(bad ? 1 : 0);
