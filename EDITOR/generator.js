/* EuroConsole schematic generator: a console configuration -> a hierarchical KiCad 9 schematic.
   Used by index.html (browser) and test_generator.js (node). Needs symbols.js (EC_SYMBOLS).

   A channel, top to bottom like a console strip:
     preamp (M480B: mic or line, or direct) -> inserts (gate M467, EQ M462B, compressor M466, de-esser M466)
     -> fader module (F300) -> CH{c}   (inserts and fader sit in the M480B fader send / return)
     -> post-fader sends: Aux 1-4, Aux 5-8, M 1-4 (4-way send modules, each on one QTP RJ45)
   Summing rows: each summing amp (M450) is one bus, named by what it sums, in order:
     M1-M4, AUX1-AUX4, AUX5-AUX8 (from the send modules the channels have), then BUSnn (direct sums of CH).
   Every net is a global label shared by all sheets.
*/
(function (root) {
  'use strict';
  const SYM = (typeof EC_SYMBOLS !== 'undefined') ? EC_SYMBOLS : require('./symbols.js');
  const LIB = 'EuroConsole';
  const GRID = 2.54;

  const SLOTS = {
    SUM:    { label: 'Summing amp', sym: 'M450', note: 'M450 program/summing amplifier' },
    INSERT: { label: 'Insert', sym: 'M499', note: 'M499 insertion switcher per bus + QTP send / return' },
    PATCH:  { label: 'Patch bay', sym: 'QTP', note: 'QTP-BITTREE patch card: top row = sends, bottom row = returns' },
    FADER:  { label: 'Fader', sym: 'FADER', note: 'master fader bank: 4 x F300, one per bus of the row' },
    BIGVU:  { label: 'Big VU', sym: 'BIGVU', note: 'Big VU (RD87) per bus pair' },
    EQ:     { label: 'EQ', sym: 'M462B', note: 'M462B equalizer bank on the row\'s buses' },
    COMP:   { label: 'Compressor', sym: 'M466', note: 'M466 compressor bank on the row\'s buses' },
    DEESS:  { label: 'De-esser', sym: 'M466', note: 'M466 de-esser bank (weighted side-chain, new) on the row\'s buses' },
    GATE:   { label: 'Gate', sym: 'M467', note: 'M467 gate bank on the row\'s buses' },
    EMPTY:  { label: 'Blank', sym: null, note: 'blank panel' },
  };
  const PAIR = ['SUN', 'SKY', 'GRASS', 'EARTH'];
  const INPUTS = { MIC: 'Mic', LINE: 'Line', DIRECT: 'Direct' };
  /* the preamp design: a choice, M480 for now */
  const PREAMPS = {
    M480:  { label: 'M480 input module', sym: 'M480' },
    M480B: { label: 'M480B input module', sym: 'M480B' },
    M460:  { label: 'M460 input module', sym: 'M460' },
    M470:  { label: 'M470 input module', sym: 'M470' },
    M441:  { label: 'M441 input module', sym: 'M441' },
  };
  /* inserts, in strip order; one module per channel, left leg */
  const CHAIN = {
    GATE:  { label: 'Gate', sym: 'M467', bom: 'M467 noise gate (channel)' },
    EQ:    { label: 'EQ', sym: 'M462B', bom: 'M462B equalizer (channel)' },
    COMP:  { label: 'Compressor', sym: 'M466', bom: 'M466 compressor (channel)' },
    DEESS: { label: 'De-esser', sym: 'M466', bom: 'M466 de-esser (channel)' },
  };
  const CHAIN_ORDER = ['GATE', 'EQ', 'COMP', 'DEESS'];
  /* post-fader 4-way send modules, in strip order */
  const SENDS = {
    A14: { label: 'Aux 1-4', buses: ['AUX1', 'AUX2', 'AUX3', 'AUX4'] },
    A58: { label: 'Aux 5-8', buses: ['AUX5', 'AUX6', 'AUX7', 'AUX8'] },
    M14: { label: 'M 1-4', buses: ['M1', 'M2', 'M3', 'M4'] },
  };
  const SEND_ORDER = ['A14', 'A58', 'M14'];
  const BUS_ORDER = ['M14', 'A14', 'A58'];          // which send buses take the first summing amps

  const TEMPLATE = { in: 'MIC', fx: ['EQ', 'COMP'], sends: ['A14', 'A58', 'M14'] };
  function defaultConfig() {
    const row = ['SUM', 'SUM', 'SUM', 'SUM', 'INSERT', 'BIGVU'];
    return { inputs: 16, rows: [['SUM', 'SUM', 'SUM', 'SUM', 'INSERT', 'COMP', 'FADER', 'BIGVU'], row, row, row].map(r => r.slice()), resistors: true, rValue: '10k', rev: 'A',
             template: JSON.parse(JSON.stringify(TEMPLATE)), channels: [], preamp: 'M480' };
  }
  /* every channel: { in, fx: [...CHAIN], sends: [...SENDS] }; missing channels take the template */
  function channels(cfg) {
    const t = cfg.template || { in: cfg.inputModule === false ? 'DIRECT' : 'MIC', fx: cfg.chain || [], sends: [] };
    const out = [];
    for (let c = 1; c <= cfg.inputs; c++) {
      const g = (cfg.channels || [])[c - 1] || t;
      out.push({ in: g.in || 'MIC', fx: CHAIN_ORDER.filter(k => (g.fx || []).includes(k)), sends: SEND_ORDER.filter(k => (g.sends || []).includes(k)) });
    }
    return out;
  }
  const pad2 = n => String(n).padStart(2, '0');
  function busCount(cfg) { return cfg.rows.reduce((n, r) => n + r.filter(s => s === 'SUM').length, 0); }
  function consoleName(cfg) { return 'C' + pad2(cfg.inputs) + pad2(busCount(cfg)); }
  /* the summing buses: [{ i, name, send: 'M14' | 'A14' | 'A58' | null, k }] */
  function buses(cfg) {
    const CHS = channels(cfg), have = k => CHS.some(c => c.sends.includes(k)), out = [], total = busCount(cfg);
    for (const s of BUS_ORDER) if (have(s)) SENDS[s].buses.forEach((name, k) => { if (out.length < total) out.push({ name, send: s, k }); });
    while (out.length < total) out.push({ name: 'BUS' + pad2(out.length + 1), send: null, k: 0 });
    return out.map((b, i) => ({ ...b, i: i + 1 }));
  }

  /* ---------- small helpers ---------- */
  const f = v => { const r = Math.round(v * 10000) / 10000; return (Object.is(r, -0) ? 0 : r).toString(); };
  const q = s => '"' + String(s).replace(/\\/g, '\\\\').replace(/"/g, '\\"') + '"';
  function uuidGen(seed) {
    let h = 2166136261 >>> 0; for (const c of seed) h = Math.imul(h ^ c.charCodeAt(0), 16777619) >>> 0;
    let n = 0;
    return () => { n++; const x = (Math.imul(h ^ n, 2654435761) >>> 0).toString(16).padStart(8, '0');
      const y = (Math.imul(h + n * 7919, 40503) >>> 0).toString(16).padStart(8, '0');
      const c = n.toString(16).padStart(12, '0');
      return `${x}-${y.slice(0, 4)}-4${y.slice(5, 8)}-8${x.slice(1, 4)}-${c}`; };
  }
  const snap = v => Math.round(v / GRID) * GRID;
  function powerNet(name) {
    const n = name.toUpperCase();
    const m = n.replace(/\s+/g, '');
    for (const v of ['+25V', '-25V', '+24V', '+35V', '+15V', '-15V', '+12V', '-12V']) if (m.includes(v)) return v;
    if (/GND|COMMON|SHIELD/.test(n)) return 'GND';
    if (n === 'VCC') return 'VCC';
    return null;
  }
  const halfW = sym => Math.max(...SYM[sym].pins.map(p => Math.abs(p.x)));

  /* ---------- a sheet: items placed in mm, y down ---------- */
  class Sheet {
    constructor(name, file, title) { this.name = name; this.file = file; this.title = title; this.items = []; this.used = new Set(); this.w = 0; this.h = 0; }
    grow(x, y) { this.w = Math.max(this.w, x); this.h = Math.max(this.h, y); }
    label(net, x, y, ang) { this.items.push({ k: 'label', net, x, y, ang }); this.grow(x + 30, y + 10); }
    nc(x, y) { this.items.push({ k: 'nc', x, y }); }
    wire(x1, y1, x2, y2) { this.items.push({ k: 'wire', x1, y1, x2, y2 }); }
    text(s, x, y, size) { this.items.push({ k: 'text', s, x, y, size: size || 2.54 }); this.grow(x + s.length * (size || 2.54) * 0.6, y + 5); }
    /* nets: {pinIndex or pin name: net | 'NC'}; power pins get their power net, the rest NC */
    place(sym, X, Y, ref, value, nets) {
      const S = SYM[sym]; this.used.add(sym);
      S.pins.forEach((p, i) => {
        const wx = X + p.x, wy = Y - p.y, out = (p.a + 180) % 360;
        let net = nets[i] !== undefined ? nets[i] : nets[p.name];
        if (net === undefined) net = (p.type === 'power_in' || /GND|COMMON|SHIELD/i.test(p.name)) ? powerNet(p.name) : null;
        if (net && net !== 'NC') this.label(net, wx, wy, out); else this.nc(wx, wy);
      });
      const top = Math.max(...S.pins.map(p => p.y)), bot = Math.min(...S.pins.map(p => p.y));
      this.items.push({ k: 'sym', sym, X, Y, ref, value, top, bot, extra: {} });
      this.grow(X + halfW(sym) + 30, Y - bot + 15);
    }
  }
  /* a processor's first two inputs and outputs (left leg); the rest NC */
  function legNets(sym, from, to) {
    const S = SYM[sym], nets = {};
    S.pins.map((p, n) => [p, n]).filter(([p]) => p.type === 'input').forEach(([p, n], m) => nets[n] = m === 0 ? from + '+' : m === 1 ? from + '-' : 'NC');
    S.pins.map((p, n) => [p, n]).filter(([p]) => p.type === 'output').forEach(([p, n], m) => nets[n] = m === 0 ? to + '+' : m === 1 ? to + '-' : 'NC');
    return nets;
  }
  const qtpNets = list => { const nets = { SHIELD: 'GND' }; PAIR.forEach((p, i) => { nets[p + '+'] = list[i] ? list[i] + '+' : 'NC'; nets[p + '-'] = list[i] ? list[i] + '-' : 'NC'; }); return nets; };
  const sendNet = (c, bus) => `C${pad2(c)}_${bus}`;

  /* ---------- build the design ---------- */
  function build(cfg) {
    const name = consoleName(cfg), N = cfg.inputs, CHS = channels(cfg), BUSES = buses(cfg);
    const ctr = { U: 0, J: 0, R: 0 }, next = k => k + (++ctr[k]);
    const bom = {}, count = (key, n = 1) => { bom[key] = (bom[key] || 0) + n; };
    const CH = c => 'CH' + pad2(c);
    const sheets = [];

    /* ---- channels ---- */
    /* every Eurorack module is a bank of 4 channels (one QTP in, one QTP out): one sheet per bank */
    const banks = [];
    const bankSheet = b => banks[b] || (banks[b] = (() => { const sh = new Sheet(`Bank ${b + 1}`, `${name}-bank${b + 1}.kicad_sch`, `${name}: bank ${b + 1}, CH ${pad2(b * 4 + 1)}-${pad2(Math.min(b * 4 + 4, N))}`); sheets.push(sh); return sh; })());
    const W = sym => 2 * halfW(sym) + 25.4;
    const rowW = sp => 58.42 + (sp.in !== 'DIRECT' ? W((PREAMPS[cfg.preamp] || PREAMPS.M480).sym) : 0) + sp.fx.reduce((w, k) => w + W(CHAIN[k].sym), 0) + W('FADER') + sp.sends.length * (W('AUX4') + 33.02);
    const rowH = 58.42;
    const bankCount = (ci, key) => { if (ci % 4 === 0) count(key); };   // one Eurorack module per bank
    CHS.forEach((sp, ci) => {
      const c = ci + 1, b = Math.floor(ci / 4), r = ci % 4, chs = bankSheet(b);
      if (r === 0) chs.text(`Bank ${b + 1}: CH ${pad2(c)}-${pad2(Math.min(c + 3, N))} · ${INPUTS[sp.in]}${sp.fx.map(k => ' · ' + CHAIN[k].label).join('')} · Fader${sp.sends.map(k => ' · ' + SENDS[k].label).join('')}  (each module = 4 channels)`, 20.32, 15.24, 3);
      const x0 = 20.32, y0 = snap(45.72 + r * rowH);
      chs.text(`CH ${pad2(c)}`, x0, y0 - 22.86, 2);
      chs.place('XLR', x0 + 12.7, y0, next('J'), sp.in === 'MIC' ? 'XLR-3F mic' : 'XLR-3F line', { HOT: `IN${pad2(c)}+`, COLD: `IN${pad2(c)}-`, GND: 'GND' }); count('XLR-3F input');
      let x = x0 + 58.42;
      const chain = (from, to) => {               // inserts then fader, from net `from` to net `to`
        sp.fx.forEach(k => {
          const sym = CHAIN[k].sym, out = `${k}${pad2(c)}`;
          chs.place(sym, snap(x + halfW(sym) + 12.7), y0, next('U'), k === 'DEESS' ? 'M466 De-esser' : sym, legNets(sym, from, out)); bankCount(ci, CHAIN[k].label + ' bank (4 x ' + sym + ')');
          x = snap(x + W(sym)); from = out;
        });
        chs.place('FADER', snap(x + halfW('FADER') + 12.7), y0, next('U'), 'F300 Fader', { 'IN+': from + '+', 'IN-': from + '-', 'OUT+': to + '+', 'OUT-': to + '-', SDA: 'I2C_SDA', SCL: 'I2C_SCL' });
        bankCount(ci, 'Fader bank (4 x F300)'); x = snap(x + W('FADER'));
      };
      if (sp.in !== 'DIRECT') {
        const mic = sp.in === 'MIC', P = PREAMPS[cfg.preamp] || PREAMPS.M480, n2 = pad2(c);
        let nets;
        if (P.sym === 'M460' || P.sym === 'M441') {   // pins come in pairs of one name: first +, second -
          const pair = P.sym === 'M460'
            ? { 'MIC IN': mic ? `IN${n2}` : null, 'LINE IN': mic ? null : `IN${n2}`, 'INSERT OUT': `FS${n2}`, 'INSERT RETURN': `FR${n2}`, 'DIRECT OUT': CH(c) }
            : { 'MIC IN': mic ? `IN${n2}` : null, 'LINE IN': mic ? null : `IN${n2}`, 'PREAMP OUT': `FS${n2}`, 'BOOSTER AMP IN': `FR${n2}`, 'SWITCHED CH ON OUT': CH(c) };
          const seen = {}; nets = {};
          SYM[P.sym].pins.forEach((p, i) => { if (p.name in pair) { const k = seen[p.name] = (seen[p.name] || 0) + 1; nets[i] = pair[p.name] ? pair[p.name] + (k === 1 ? '+' : '-') : 'NC'; } });
        } else if (P.sym === 'M470') nets = {
          'MIC-IN-1 +': mic ? `IN${n2}+` : 'NC', 'MIC-IN-1 -': mic ? `IN${n2}-` : 'NC', 'LINE-IN +': mic ? 'NC' : `IN${n2}+`, 'LINE-IN -': mic ? 'NC' : `IN${n2}-`,
          'INSERT-OUT +': `FS${n2}+`, 'INSERT-OUT -': `FS${n2}-`, 'INSERT-RETURN +': `FR${n2}+`, 'INSERT-RETURN -': `FR${n2}-`, 'DIRECT OUT +': CH(c) + '+', 'DIRECT OUT -': CH(c) + '-' };
        else nets = {
          'MIC-IN-B +': mic ? `IN${n2}+` : 'NC', 'MIC-IN-B -': mic ? `IN${n2}-` : 'NC',
          'Line IN-B +': mic ? 'NC' : `IN${n2}+`, 'Line IN-B -': mic ? 'NC' : `IN${n2}-`,
          'Fader Send +': `FS${n2}+`, 'Fader Send -': `FS${n2}-`, 'Fader Return +': `FR${n2}+`, 'Fader Return -': `FR${n2}-`,
          'M1 OUT +': CH(c) + '+', 'M1 OUT -': CH(c) + '-', 'Cue Solo +': 'NC', 'Cue Solo -': 'NC',
          'M2 OUT +': 'NC', 'M2 OUT -': 'NC', 'Aux +': 'NC', 'Aux -': 'NC' };
        chs.place(P.sym, snap(x + halfW(P.sym) + 12.7), y0, next('U'), `${P.sym} ${mic ? 'mic' : 'line'}`, nets); bankCount(ci, `Quad preamp (4 x ${P.sym} preamp + 4 vertical VU)`);
        x = snap(x + 2 * halfW(P.sym) + 25.4 - 104.14);
        x = snap(x + 104.14);
        chain(`FS${pad2(c)}`, `FR${pad2(c)}`);       // inserts + fader in the M480B fader send / return
      } else chain(`IN${pad2(c)}`, CH(c));
      sp.sends.forEach(k => {                        // post-fader 4-way sends, each on its own QTP
        const outs = SENDS[k].buses.map(b => sendNet(c, b)), nets = { 'IN+': CH(c) + '+', 'IN-': CH(c) + '-', SDA: 'I2C_SDA', SCL: 'I2C_SCL' };
        outs.forEach((n, i) => { nets[`SEND${i + 1}+`] = n + '+'; nets[`SEND${i + 1}-`] = n + '-'; });
        chs.place('AUX4', snap(x + halfW('AUX4') + 12.7), y0, next('U'), SENDS[k].label, nets); bankCount(ci, SENDS[k].label + ' send bank (4 x 4-way send)');
        x = snap(x + W('AUX4'));
        chs.place('QTP', snap(x + 10.16), y0, next('J'), `CH${pad2(c)} ${SENDS[k].label}`, qtpNets(outs)); count('QTP RJ45');
        x = snap(x + 33.02);
      });
    });
    if (BUSES.some(b => !b.send)) banks.forEach((chs, g) => {
      const qx = snap(chs.w + 20);
      chs.text('Bank QTP out: CH to the direct summing rows', qx, 30.48, 2);
      const list = [0, 1, 2, 3].map(i => g * 4 + i + 1 <= N ? CH(g * 4 + i + 1) : null);
      chs.place('QTP', qx + 10.16, 45.72, next('J'), `QTP OUT ${g * 4 + 1}-${Math.min(g * 4 + 4, N)}`, qtpNets(list)); count('QTP RJ45');
    });

    /* ---- summing rows ---- */
    let bi = 0;
    cfg.rows.forEach((slots, ri) => {
      const R = ri + 1, sh = new Sheet(`Row ${R}`, `${name}-row${R}.kicad_sch`, `${name}: summing row ${R}`);
      sheets.push(sh);
      const rb = []; slots.forEach(s => { if (s === 'SUM') rb.push(BUSES[bi++]); });
      const hasIns = slots.includes('INSERT'), patchOut = slots.includes('PATCH') && !hasIns;
      /* each bus runs through the row's stages in slot order: summing amp -> insert / processors / fader -> bus out */
      const STAGES = ['INSERT', 'GATE', 'EQ', 'COMP', 'DEESS', 'FADER'];
      const stages = slots.filter(s => STAGES.includes(s));
      const sn = (b, i) => i >= stages.length ? b.name : i === 0 ? `${b.name}_SUM` : `${b.name}_${stages[i - 1]}`;   // the net into stage i
      sh.text(`Row ${R}: ${slots.map(s => SLOTS[s].label).join(' | ')}  -  ${rb.map(b => b.name).join(' ') || 'no buses'}`, 20.32, 15.24, 3);
      // QTP inputs: one per channel per send module feeding this row, or the CH groups for direct sums
      sh.text('QTP in', 20.32, 27.94, 2);
      let qy = 45.72;
      const mods = [...new Set(rb.filter(b => b.send).map(b => b.send))];
      mods.forEach(k => CHS.forEach((sp, ci) => { if (!sp.sends.includes(k)) return;
        sh.place('QTP', 30.48, snap(qy), next('J'), `CH${pad2(ci + 1)} ${SENDS[k].label}`, qtpNets(SENDS[k].buses.map(b => sendNet(ci + 1, b)))); count('QTP RJ45'); qy += 38.1; }));
      if (rb.some(b => !b.send)) for (let g = 0; g < Math.ceil(N / 4); g++) {
        sh.place('QTP', 30.48, snap(qy), next('J'), `QTP IN ${g * 4 + 1}-${Math.min(g * 4 + 4, N)}`, qtpNets([0, 1, 2, 3].map(i => g * 4 + i + 1 <= N ? CH(g * 4 + i + 1) : null))); count('QTP RJ45'); qy += 38.1;
      }
      // summing amps with their resistor matrix: no amp sums more than 8 (rule), so a bus is a tree of groups of 8
      const pitch = 7.62, rx0 = 81.28, blockH = 76.2, MAXIN = 8;
      const groupsOf = (a, n) => { const o = []; for (let i = 0; i < a.length; i += n) o.push(a.slice(i, i + n)); return o; };
      let yb = 40.64;
      const ampBlock = (label, src, node, outNet, value) => {
        const y = snap(yb); yb += blockH;
        sh.text(`${label}: ${src.length} in`, rx0, y - 20.32, 2);
        if (cfg.resistors && src.length) {
          ['+', '-'].forEach((pol, pi) => {
            const ry = snap(y + pi * 25.4);
            src.forEach((net, j) => {
              const xr = rx0 + j * pitch; sh.used.add('R');
              sh.items.push({ k: 'sym', sym: 'R', X: xr, Y: ry, ref: next('R'), value: cfg.rValue, top: 3.81, bot: -3.81, extra: { small: true } });
              sh.label(net + pol, xr, ry - 3.81, 90);
              if (j) sh.wire(xr - pitch, ry + 3.81, xr, ry + 3.81);
            });
            const xe = rx0 + (src.length - 1) * pitch + 10.16;
            sh.wire(rx0 + (src.length - 1) * pitch, ry + 3.81, xe, ry + 3.81);
            sh.label(`${node}${pol}`, xe, ry + 3.81, 0);
          });
          count(`Summing resistor ${cfg.rValue}`, 2 * src.length);
        }
        sh.place('M450', snap(rx0 + MAXIN * pitch + 50.8), snap(y + 12.7), next('U'), value, {
          'SUMMING INPUT +': node + '+', 'SUMMING INPUT -': node + '-',
          'OUTPUT +': outNet + '+', 'OUTPUT -': outNet + '-', 'INPUT SHIELD': 'GND', COMMON: 'GND', GND: 'GND' }); count('M450 summing amplifier');
      };
      rb.forEach(bus => {
        const feed = CHS.map((sp, ci) => ({ ci, net: !bus.send ? CH(ci + 1) : sp.sends.includes(bus.send) ? sendNet(ci + 1, bus.name) : null })).filter(x => x.net);
        let src = feed.map(x => x.net), level = 0;
        if (src.length > MAXIN) {                    // first level: one group per 8 channels by position (CH 1-8, 9-16 ...): it sits with those channels
          const byPos = {}; feed.forEach(x => (byPos[Math.floor(x.ci / MAXIN)] = byPos[Math.floor(x.ci / MAXIN)] || []).push(x.net));
          src = Object.keys(byPos).map(Number).sort((a, b) => a - b).map(g => { const o = `${bus.name}_G${g + 1}`;
            ampBlock(`${bus.name} CH ${pad2(g * MAXIN + 1)}-${pad2(Math.min(g * MAXIN + MAXIN, N))}`, byPos[g], `SUMN_${o}`, o, `M450 ${o}`); return o; });
          level = 1;
        }
        while (src.length > MAXIN) {                 // more than 8 groups: sum the groups in eights again
          src = groupsOf(src, MAXIN).map((g, gi) => { const o = `${bus.name}_L${level}G${gi + 1}`; ampBlock(`${bus.name} groups, set ${gi + 1}`, g, `SUMN_${o}`, o, `M450 ${o}`); return o; });
          level++;
        }
        ampBlock(level ? `${bus.name} = sum of ${src.length} groups` : bus.name, src, `SUMN_${bus.name}`, sn(bus, 0), `M450 ${bus.name}`);
      });
      // the other slots
      let sx = snap(rx0 + MAXIN * pitch + 50.8 + 111.76), sy = 40.64;
      const chunk = (arr, n) => { const o = []; for (let i = 0; i < arr.length; i += n) o.push(arr.slice(i, i + n)); return o; };
      const qtpBus = (label, prefix, group) => { sh.place('QTP', sx + 10.16, snap(sy), next('J'), label, qtpNets(group.map(b => prefix + b.name))); count('QTP RJ45'); sy += 38.1; };
      const span = g => `${g[0].name}-${g[g.length - 1].name}`;
      let st = 0;
      slots.forEach((s, si) => {
        if (s === 'SUM' || s === 'EMPTY') return;
        sh.text(`Slot ${si + 1}: ${SLOTS[s].label}`, sx, sy - 10.16, 2); sy += 7.62;
        const k = STAGES.includes(s) ? st++ : -1, into = b => sn(b, k), outof = b => sn(b, k + 1);
        if (s === 'INSERT') {                       // send = the net into the insert, return -> M499 -> next stage
          rb.forEach(b => { sh.place('M499', sx + 33.02, snap(sy + 5.08), next('U'), `M499 ${b.name}`, { 'IN +': `RET_${b.name}+`, 'IN -': `RET_${b.name}-`, 'OUT +': outof(b) + '+', 'OUT -': outof(b) + '-', VCC: 'VCC', GND: 'GND' }); sy += 33.02; });
          count('Insert bank (4 x M499)', Math.ceil(rb.length / 4));
          chunk(rb, 4).forEach(g => { sh.place('QTP', sx + 10.16, snap(sy), next('J'), `INSERT SEND ${span(g)}`, qtpNets(g.map(into))); count('QTP RJ45'); sy += 38.1; qtpBus(`INSERT RETURN ${span(g)}`, 'RET_', g); });
        } else if (s === 'PATCH') {
          const ins = slots.indexOf('INSERT') >= 0 ? stages.indexOf('INSERT') : -1;
          if (ins >= 0) chunk(rb, 4).forEach(g => { sh.place('QTP', sx + 10.16, snap(sy), next('J'), `PATCH TOP (sends) ${span(g)}`, qtpNets(g.map(b => sn(b, ins)))); count('QTP RJ45'); sy += 38.1; qtpBus(`PATCH BOTTOM (returns) ${span(g)}`, 'RET_', g); });
          else { chunk(rb, 4).forEach(g => { qtpBus(`PATCH TOP (bus out) ${span(g)}`, '', g); qtpBus(`PATCH BOTTOM (to row out) ${span(g)}`, 'OUT_', g); });
            sh.text('Half-normal: OUT = bus when nothing is patched', sx, sy, 1.5); sy += 5.08; }
          count('QTP-BITTREE patch card', Math.ceil(rb.length / 4));
        } else if (s === 'FADER') {
          rb.forEach(b => { sh.place('FADER', sx + 25.4, snap(sy + 10.16), next('U'), `F300 ${b.name}`, { 'IN+': into(b) + '+', 'IN-': into(b) + '-', 'OUT+': outof(b) + '+', 'OUT-': outof(b) + '-', SDA: 'I2C_SDA', SCL: 'I2C_SCL' }); sy += 33.02; });
          count('Master fader bank (4 x F300)', Math.ceil(rb.length / 4));
        } else if (s === 'BIGVU') {
          chunk(rb, 2).forEach(g => { sh.place('BIGVU', sx + 22.86, snap(sy + 7.62), next('U'), `Big VU ${g.map(b => b.name).join('/')}`, { 'L+': g[0].name + '+', 'L-': g[0].name + '-', 'R+': g[1] ? g[1].name + '+' : 'NC', 'R-': g[1] ? g[1].name + '-' : 'NC' }); sy += 33.02; });
          count('Big VU (RD87)', Math.ceil(rb.length / 2));
        } else {                                     // EQ / compressor / de-esser / gate: a bank of 4 inline on the row's buses
          const sym = SLOTS[s].sym;
          rb.forEach(b => { sh.place(sym, sx + halfW(sym) + 12.7, snap(sy + 10.16), next('U'), `${s === 'DEESS' ? 'M466 De-esser' : sym} ${b.name}`, legNets(sym, into(b), outof(b))); sy += 45.72; });
          count(`${SLOTS[s].label} bank (4 x ${sym}, bus)`, Math.ceil(rb.length / 4));
        }
        sy += 10.16;
      });
      if (rb.length) { sh.text('Bus outputs', sx, sy, 2); sy += 12.7; chunk(rb, 4).forEach(g => qtpBus(`BUS OUT ${span(g)}`, patchOut ? 'OUT_' : '', g)); }
    });
    return { name, sheets, bom, buses: BUSES, channels: CHS, cfg };
  }

  /* ---------- serialise ---------- */
  const PAPERS = [['A3', 420, 297], ['A2', 594, 420], ['A1', 841, 594], ['A0', 1189, 841]];
  function paperFor(w, h) { for (const [n, pw, ph] of PAPERS) if (w + 20 <= pw && h + 20 <= ph) return `(paper "${n}")`; return `(paper "User" ${f(Math.ceil(w + 40))} ${f(Math.ceil(h + 40))})`; }

  function libSymbols(used) {
    return '(lib_symbols\n' + [...used].map(k => SYM[k].sexpr.replace(`(symbol "${k}"`, `(symbol "${LIB}:${k}"`)).join('\n') + '\n)';
  }
  function titleBlock(title, cfg, page) {
    return `(title_block (title ${q(title)}) (date "${new Date().toISOString().slice(0, 10)}") (rev ${q(cfg.rev || 'A')}) (company "Ward-Beck Systems") (comment 1 "EuroConsole - generated by the console editor") (comment 2 "Ward-Beck.com - Ward-Beck.ca"))`;
  }
  const FONT = s => `(effects (font (size ${s} ${s})))`;

  function sheetBody(sh, ctx, path) {
    const U = ctx.uuid, out = [];
    for (const it of sh.items) {
      if (it.k === 'label') {
        const just = (it.ang === 180 || it.ang === 270) ? 'right' : 'left';
        out.push(`(global_label ${q(it.net)} (shape passive) (at ${f(it.x)} ${f(it.y)} ${it.ang}) (fields_autoplaced yes) (effects (font (size 1.27 1.27)) (justify ${just})) (uuid "${U()}") (property "Intersheetrefs" "\${INTERSHEET_REFS}" (at ${f(it.x)} ${f(it.y)} 0) (effects (font (size 1.27 1.27)) (hide yes))))`);
      } else if (it.k === 'nc') out.push(`(no_connect (at ${f(it.x)} ${f(it.y)}) (uuid "${U()}"))`);
      else if (it.k === 'wire') out.push(`(wire (pts (xy ${f(it.x1)} ${f(it.y1)}) (xy ${f(it.x2)} ${f(it.y2)})) (stroke (width 0) (type default)) (uuid "${U()}"))`);
      else if (it.k === 'text') out.push(`(text ${q(it.s)} (exclude_from_sim no) (at ${f(it.x)} ${f(it.y)} 0) (effects (font (size ${it.size} ${it.size})) (justify left)) (uuid "${U()}"))`);
      else if (it.k === 'sym') {
        const S = SYM[it.sym], small = it.extra.small;
        const ry = small ? it.Y : it.Y - it.top - 3.81, vy = small ? it.Y : it.Y - it.bot + 3.81;
        const rx = small ? it.X + 2.54 : it.X, rot = small ? 90 : 0;
        const props = [
          `(property "Reference" ${q(it.ref)} (at ${f(rx)} ${f(ry - (small ? 1.27 : 0))} ${rot}) ${FONT(1.27)})`,
          `(property "Value" ${q(it.value)} (at ${f(small ? it.X - 2.54 : it.X)} ${f(vy)} ${rot}) ${FONT(1.27)})`,
          `(property "Footprint" "" (at ${f(it.X)} ${f(it.Y)} 0) (effects (font (size 1.27 1.27)) (hide yes)))`,
          `(property "Datasheet" "" (at ${f(it.X)} ${f(it.Y)} 0) (effects (font (size 1.27 1.27)) (hide yes)))`,
          `(property "Description" "" (at ${f(it.X)} ${f(it.Y)} 0) (effects (font (size 1.27 1.27)) (hide yes)))`];
        const pins = S.pins.map(p => `(pin ${q(p.num)} (uuid "${U()}"))`).join(' ');
        out.push(`(symbol (lib_id "${LIB}:${it.sym}") (at ${f(it.X)} ${f(it.Y)} 0) (unit 1) (exclude_from_sim no) (in_bom yes) (on_board yes) (dnp no) (uuid "${U()}")\n ${props.join('\n ')}\n ${pins}\n (instances (project ${q(ctx.name)} (path "${path}" (reference ${q(it.ref)}) (unit 1)))))`);
      }
    }
    return out.join('\n');
  }

  function serialize(design) {
    const ctx = { name: design.name, uuid: uuidGen(design.name + JSON.stringify(design.cfg)) };
    const rootU = ctx.uuid(), files = {};
    // root sheet: notes + sheet symbols
    const root = [];
    const cfg = design.cfg;
    const note = [`${design.name}: ${cfg.inputs} inputs x ${design.buses.length} summing amps (${design.buses.map(b => b.name).join(' ')})`,
      `Rows: ${cfg.rows.map((r, i) => `${i + 1}: ${r.map(s => SLOTS[s].label).join(' / ')}`).join('   ')}`,
      'Channel: XLR -> M480B preamp (mic / line) -> inserts + F300 fader in its fader send / return -> CH -> post-fader sends Aux 1-4, Aux 5-8, M 1-4 (one QTP each).',
      'Nets are global labels: IN, FS / FR (fader send / return), CH, Cnn_<bus> (channel sends), SUMN_<bus>, SEND_ / RET_ (bus inserts), <bus> outputs, P<ref>_ (patch points).'];
    note.forEach((s, i) => root.push(`(text ${q(s)} (exclude_from_sim no) (at 20.32 ${f(25.4 + i * 6.35)} 0) (effects (font (size ${i ? 2 : 3.5} ${i ? 2 : 3.5})) (justify left)) (uuid "${ctx.uuid()}"))`));
    const bomLines = Object.entries(design.bom).map(([k, v]) => `${v} x ${k}`);
    root.push(`(text ${q('Parts: ' + bomLines.join(' · '))} (exclude_from_sim no) (at 20.32 55.88 0) (effects (font (size 2 2)) (justify left)) (uuid "${ctx.uuid()}"))`);
    design.sheets.forEach((sh, i) => {
      const su = ctx.uuid(); sh.uuid = su; sh.page = i + 2;
      const x = 20.32 + (i % 5) * 76.2, y = 76.2 + Math.floor(i / 5) * 50.8;
      root.push(`(sheet (at ${f(x)} ${f(y)}) (size 63.5 30.48) (exclude_from_sim no) (in_bom yes) (on_board yes) (dnp no) (fields_autoplaced yes) (stroke (width 0.1524) (type solid)) (fill (color 0 0 0 0.0000)) (uuid "${su}")
 (property "Sheetname" ${q(sh.name)} (at ${f(x)} ${f(y - 0.7112)} 0) (effects (font (size 1.27 1.27)) (justify left bottom)))
 (property "Sheetfile" ${q(sh.file)} (at ${f(x)} ${f(y + 31.0688)} 0) (effects (font (size 1.27 1.27)) (justify left top)))
 (instances (project ${q(design.name)} (path "/${rootU}" (page "${sh.page}")))))`);
    });
    files[`${design.name}.kicad_sch`] = `(kicad_sch (version 20250114) (generator "eeschema") (generator_version "9.0") (uuid "${rootU}") (paper "A3")
${titleBlock(design.name + ' EuroConsole', design.cfg)}
(lib_symbols)
${root.join('\n')}
(sheet_instances (path "/" (page "1")))
(embedded_fonts no)
)
`;
    design.sheets.forEach(sh => {
      const body = sheetBody(sh, ctx, `/${rootU}/${sh.uuid}`);
      files[sh.file] = `(kicad_sch (version 20250114) (generator "eeschema") (generator_version "9.0") (uuid "${ctx.uuid()}") ${paperFor(sh.w, sh.h)}
${titleBlock(sh.title, design.cfg)}
${libSymbols(sh.used)}
${body}
(embedded_fonts no)
)
`;
    });
    files[`${design.name}.kicad_pro`] = JSON.stringify({ meta: { filename: `${design.name}.kicad_pro`, version: 3 },
      sheets: [[rootU, 'Root'], ...design.sheets.map(s => [s.uuid, s.name])], text_variables: {} }, null, 2) + '\n';
    const used = new Set(); design.sheets.forEach(sh => sh.used.forEach(k => used.add(k)));
    files['EuroConsole.kicad_sym'] = '(kicad_symbol_lib (version 20241209) (generator "EuroConsole") (generator_version "1.0")\n' +
      [...used].map(k => SYM[k].sexpr).join('\n') + '\n)\n';
    files['sym-lib-table'] = '(sym_lib_table\n  (version 7)\n  (lib (name "EuroConsole")(type "KiCad")(uri "${KIPRJMOD}/EuroConsole.kicad_sym")(options "")(descr "EuroConsole modules: Ward-Beck archive symbols + EuroConsole parts"))\n)\n';
    files[`${design.name}-config.json`] = JSON.stringify(design.cfg, null, 2) + '\n';
    files[`${design.name}-parts.csv`] = 'qty,part\n' + Object.entries(design.bom).map(([k, v]) => `${v},"${k}"`).join('\n') + '\n';
    return files;
  }

  /* ---------- zip (store, no compression) ---------- */
  const CRC = (() => { const t = new Uint32Array(256); for (let n = 0; n < 256; n++) { let c = n; for (let k = 0; k < 8; k++) c = c & 1 ? 0xEDB88320 ^ (c >>> 1) : c >>> 1; t[n] = c >>> 0; } return t; })();
  function crc32(u8) { let c = 0xFFFFFFFF; for (let i = 0; i < u8.length; i++) c = CRC[(c ^ u8[i]) & 0xFF] ^ (c >>> 8); return (c ^ 0xFFFFFFFF) >>> 0; }
  function zip(files, folder) {
    const enc = new TextEncoder(), parts = [], cent = []; let off = 0;
    const u16 = v => [v & 255, (v >>> 8) & 255], u32 = v => [v & 255, (v >>> 8) & 255, (v >>> 16) & 255, (v >>> 24) & 255];
    for (const [n, text] of Object.entries(files)) {
      const name = enc.encode((folder ? folder + '/' : '') + n), data = enc.encode(text), crc = crc32(data);
      const head = [...u32(0x04034b50), ...u16(20), ...u16(0x0800), ...u16(0), ...u16(0), ...u16(0x21), ...u32(crc), ...u32(data.length), ...u32(data.length), ...u16(name.length), ...u16(0)];
      parts.push(new Uint8Array(head), name, data);
      cent.push(new Uint8Array([...u32(0x02014b50), ...u16(20), ...u16(20), ...u16(0x0800), ...u16(0), ...u16(0), ...u16(0x21), ...u32(crc), ...u32(data.length), ...u32(data.length), ...u16(name.length), ...u16(0), ...u16(0), ...u16(0), ...u16(0), ...u32(0), ...u32(off)]), name);
      off += head.length + name.length + data.length;
    }
    const csize = cent.reduce((n, a) => n + a.length, 0);
    const end = new Uint8Array([...u32(0x06054b50), ...u16(0), ...u16(0), ...u16(Object.keys(files).length), ...u16(Object.keys(files).length), ...u32(csize), ...u32(off), ...u16(0)]);
    return new Blob([...parts, ...cent, end], { type: 'application/zip' });
  }

  const API = { SLOTS, PAIR, INPUTS, PREAMPS, CHAIN, CHAIN_ORDER, SENDS, SEND_ORDER, TEMPLATE, channels, buses, defaultConfig, consoleName, busCount, build, serialize, zip, symbols: SYM };
  if (typeof module !== 'undefined') module.exports = API; else root.EC = API;
})(typeof window !== 'undefined' ? window : globalThis);
