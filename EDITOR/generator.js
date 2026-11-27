/* EuroConsole schematic generator: a console configuration -> a hierarchical KiCad 9 schematic.
   Used by index.html (browser) and test_generator.js (node). Needs symbols.js (EC_SYMBOLS).

   Signal flow (net names are global labels, shared by every sheet):
     XLR IN{c}±  -> M480B mic in;  M480B fader send FS{c}± -> B300/F300 strip -> FR{c}± fader return
     M480B M1 out = CH{c}±  -> QTP out (4 channels per RJ45, SUN SKY GRASS EARTH)
     every summing row: QTP in (all channels) -> summing resistor per channel -> M450 summing input SUMN{b}±
     M450 out -> BUS{b}± (or SEND{b}± when the row has an insert: SEND -> QTP send, QTP return RET{b}± -> M499 -> BUS{b}±)
     Big VU meters BUS pairs; EQ / compressor / de-esser / gate patch in through their own QTP (P{ref}_...).
*/
(function (root) {
  'use strict';
  const SYM = (typeof EC_SYMBOLS !== 'undefined') ? EC_SYMBOLS : require('./symbols.js');
  const LIB = 'EuroConsole';
  const GRID = 2.54;

  const SLOTS = {
    SUM:    { label: 'Summing amp', sym: 'M450', hp: 6, note: 'M450 program/summing amplifier' },
    INSERT: { label: 'Insert', sym: 'M499', hp: 6, note: 'M499 insertion switcher per bus + QTP send / return' },
    PATCH:  { label: 'Patch bay', sym: 'QTP', hp: 6, note: 'QTP-BITTREE patch card: top row = sends, bottom row = returns' },
    BIGVU:  { label: 'Big VU', sym: 'BIGVU', hp: 6, note: 'Big VU (RD87) per bus pair' },
    EQ:     { label: 'EQ', sym: 'M462B', hp: 6, note: 'M462B equalizer, patched' },
    COMP:   { label: 'Compressor', sym: 'M466', hp: 6, note: 'M466 limiter-compressor, patched' },
    DEESS:  { label: 'De-esser', sym: 'M466', hp: 6, note: 'M466 with a weighted side-chain (new), patched' },
    GATE:   { label: 'Gate', sym: 'M467', hp: 6, note: 'M467 noise gate, patched' },
    EMPTY:  { label: 'Blank', sym: null, hp: 6, note: 'blank panel' },
  };
  const PAIR = ['SUN', 'SKY', 'GRASS', 'EARTH'];

  function defaultConfig() {
    const row = ['SUM', 'SUM', 'SUM', 'SUM', 'INSERT', 'BIGVU'];
    return { inputs: 16, inputModule: true, rows: [row, row, row, row].map(r => r.slice()),
             resistors: true, rValue: '10k', rev: 'A' };
  }
  const pad2 = n => String(n).padStart(2, '0');
  function busCount(cfg) { return cfg.rows.reduce((n, r) => n + r.filter(s => s === 'SUM').length, 0); }
  function consoleName(cfg) { return 'C' + pad2(cfg.inputs) + pad2(busCount(cfg)); }

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
    for (const v of ['+25V', '-25V', '+24V', '+35V', '+15V', '-15V', '+12V', '-12V'])
      if (n.includes(v)) return v;
    if (/GND|COMMON|SHIELD/.test(n)) return 'GND';
    if (n === 'VCC') return 'VCC';
    return null;
  }

  /* ---------- a sheet: items placed in mm, y down ---------- */
  class Sheet {
    constructor(name, file, title) { this.name = name; this.file = file; this.title = title; this.items = []; this.used = new Set(); this.w = 0; this.h = 0; }
    grow(x, y) { this.w = Math.max(this.w, x); this.h = Math.max(this.h, y); }
    label(net, x, y, ang) { this.items.push({ k: 'label', net, x, y, ang }); this.grow(x + 30, y + 10); }
    nc(x, y) { this.items.push({ k: 'nc', x, y }); }
    wire(x1, y1, x2, y2) { this.items.push({ k: 'wire', x1, y1, x2, y2 }); }
    text(s, x, y, size) { this.items.push({ k: 'text', s, x, y, size: size || 2.54 }); this.grow(x + s.length * (size || 2.54) * 0.6, y + 5); }
    /* place a symbol; nets: {pinIndex or pin name: net | 'NC'}; power pins get their power net, the rest NC */
    place(sym, X, Y, ref, value, nets, extra) {
      const S = SYM[sym]; this.used.add(sym);
      const pins = S.pins.map((p, i) => {
        const wx = X + p.x, wy = Y - p.y, out = (p.a + 180) % 360;
        let net = nets[i] !== undefined ? nets[i] : nets[p.name];
        if (net === undefined) net = (p.type === 'power_in' || /GND|COMMON|SHIELD/i.test(p.name)) ? powerNet(p.name) : null;
        if (net && net !== 'NC') this.label(net, wx, wy, out); else this.nc(wx, wy);
        return { ...p, wx, wy, net };
      });
      const top = Math.max(...S.pins.map(p => p.y)), bot = Math.min(...S.pins.map(p => p.y));
      this.items.push({ k: 'sym', sym, X, Y, ref, value, top, bot, extra: extra || {} });
      this.grow(X + 60, Y - bot + 15);
      return pins;
    }
  }

  /* ---------- build the design ---------- */
  function build(cfg) {
    const name = consoleName(cfg), N = cfg.inputs;
    const ctr = { U: 0, J: 0, R: 0 }, next = k => k + (++ctr[k]);
    const bom = {};
    const count = (key, n = 1) => { bom[key] = (bom[key] || 0) + n; };
    const CH = c => 'CH' + pad2(c);
    const sheets = [];

    /* channels */
    const chs = new Sheet('Channels', `${name}-channels.kicad_sch`, `${name}: ${N} input channels`);
    sheets.push(chs);
    const perCol = 8, colW = 271.78, rowH = 53.34;
    chs.text(`${N} input channels: XLR -> ${cfg.inputModule ? 'M480B input module (fader send/return through the B300/F300 strip) -> ' : ''}B300/F300 strip -> CH01..CH${pad2(N)} -> QTP out`, 20.32, 15.24, 3);
    for (let c = 1; c <= N; c++) {
      const col = Math.floor((c - 1) / perCol), r = (c - 1) % perCol;
      const x0 = 20.32 + col * colW, y0 = snap(40.64 + r * rowH);
      chs.text(`CH ${pad2(c)}`, x0, y0 - 17.78, 2);
      chs.place('XLR', x0 + 12.7, y0, next('J'), 'XLR-3F', { HOT: `IN${pad2(c)}+`, COLD: `IN${pad2(c)}-`, GND: 'GND' }); count('XLR-3F input');
      if (cfg.inputModule) {
        chs.place('M480B', x0 + 96.52, y0, next('U'), 'M480B', {
          'MIC-IN-B +': `IN${pad2(c)}+`, 'MIC-IN-B -': `IN${pad2(c)}-`,
          'Fader Send +': `FS${pad2(c)}+`, 'Fader Send -': `FS${pad2(c)}-`,
          'Fader Return +': `FR${pad2(c)}+`, 'Fader Return -': `FR${pad2(c)}-`,
          'M1 OUT +': CH(c) + '+', 'M1 OUT -': CH(c) + '-',
          'Line IN-B +': 'NC', 'Line IN-B -': 'NC', 'Cue Solo +': 'NC', 'Cue Solo -': 'NC',
          'M2 OUT +': 'NC', 'M2 OUT -': 'NC', 'Aux +': 'NC', 'Aux -': 'NC' }); count('M480B input module');
        chs.place('STRIP', x0 + 200.66, y0, next('U'), 'B300/F300', {
          'IN+': `FS${pad2(c)}+`, 'IN-': `FS${pad2(c)}-`, 'OUT+': `FR${pad2(c)}+`, 'OUT-': `FR${pad2(c)}-`, SDA: 'I2C_SDA', SCL: 'I2C_SCL' });
      } else {
        chs.place('STRIP', x0 + 96.52, y0, next('U'), 'B300/F300', {
          'IN+': `IN${pad2(c)}+`, 'IN-': `IN${pad2(c)}-`, 'OUT+': CH(c) + '+', 'OUT-': CH(c) + '-', SDA: 'I2C_SDA', SCL: 'I2C_SCL' });
      }
      count('B300/F300 channel strip');
    }
    const qx = 20.32 + Math.ceil(N / perCol) * colW;
    chs.text('QTP out: 4 channels per RJ45, to every summing row', qx, 25.4, 2);
    for (let g = 0; g < Math.ceil(N / 4); g++) {
      const nets = {}; PAIR.forEach((p, i) => { const c = g * 4 + i + 1; nets[p + '+'] = c <= N ? CH(c) + '+' : 'NC'; nets[p + '-'] = c <= N ? CH(c) + '-' : 'NC'; });
      nets.SHIELD = 'GND';
      chs.place('QTP', qx + 10.16, snap(45.72 + g * 38.1), next('J'), `QTP OUT ${g * 4 + 1}-${Math.min(g * 4 + 4, N)}`, nets); count('QTP RJ45');
    }

    /* summing rows */
    let b = 0;
    cfg.rows.forEach((slots, ri) => {
      const R = ri + 1, sh = new Sheet(`Row ${R}`, `${name}-row${R}.kicad_sch`, `${name}: summing row ${R}`);
      sheets.push(sh);
      const nSum = slots.filter(s => s === 'SUM').length;
      const buses = []; for (let k = 0; k < nSum; k++) buses.push(++b);
      const hasIns = slots.includes('INSERT'), patchOut = slots.includes('PATCH') && !hasIns;   // patch bay alone: it carries the bus outputs
      sh.text(`Row ${R}: ${slots.map(s => SLOTS[s].label).join(' | ')}  -  buses ${buses.length ? buses[0] + '-' + buses[buses.length - 1] : 'none'}`, 20.32, 15.24, 3);
      // QTP inputs (all channels)
      sh.text('QTP in: all channels', 20.32, 27.94, 2);
      for (let g = 0; g < Math.ceil(N / 4); g++) {
        const nets = { SHIELD: 'GND' }; PAIR.forEach((p, i) => { const c = g * 4 + i + 1; nets[p + '+'] = c <= N ? CH(c) + '+' : 'NC'; nets[p + '-'] = c <= N ? CH(c) + '-' : 'NC'; });
        sh.place('QTP', 30.48, snap(45.72 + g * 38.1), next('J'), `QTP IN ${g * 4 + 1}-${Math.min(g * 4 + 4, N)}`, nets); count('QTP RJ45');
      }
      // summing amps with their resistor matrix
      const pitch = 7.62, rx0 = 81.28, blockH = 76.2;
      buses.forEach((bus, k) => {
        const y = snap(40.64 + k * blockH);
        sh.text(`Bus ${bus}: ${N} channels summed`, rx0, y - 20.32, 2);
        const out = hasIns ? `SEND${pad2(bus)}` : `BUS${pad2(bus)}`;
        let ampX = rx0 + 60;
        if (cfg.resistors) {
          ['+', '-'].forEach((pol, pi) => {
            const ry = snap(y + pi * 25.4);
            for (let c = 1; c <= N; c++) {
              const x = rx0 + (c - 1) * pitch;
              const ref = next('R'); sh.used.add('R');
              sh.items.push({ k: 'sym', sym: 'R', X: x, Y: ry, ref, value: cfg.rValue, top: 3.81, bot: -3.81, extra: { small: true } });
              sh.label(CH(c) + pol, x, ry - 3.81, 90);
              if (c > 1) sh.wire(x - pitch, ry + 3.81, x, ry + 3.81);
            }
            const xe = rx0 + (N - 1) * pitch + 10.16;
            sh.wire(rx0 + (N - 1) * pitch, ry + 3.81, xe, ry + 3.81);
            sh.label(`SUMN${pad2(bus)}${pol}`, xe, ry + 3.81, 0);
          });
          count(`Summing resistor ${cfg.rValue}`, 2 * N);
          ampX = rx0 + N * pitch + 50.8;
        }
        sh.place('M450', snap(ampX), snap(y + 12.7), next('U'), 'M450', {
          'SUMMING INPUT +': cfg.resistors ? `SUMN${pad2(bus)}+` : `SUMN${pad2(bus)}+`, 'SUMMING INPUT -': `SUMN${pad2(bus)}-`,
          'OUTPUT +': out + '+', 'OUTPUT -': out + '-', 'INPUT SHIELD': 'GND', COMMON: 'GND', GND: 'GND' }); count('M450 summing amplifier');
      });
      // the other slots
      let sx = snap(rx0 + (cfg.resistors ? N * pitch + 50.8 : 60) + 111.76), sy = 40.64;
      const chunk = (arr, n) => { const o = []; for (let i = 0; i < arr.length; i += n) o.push(arr.slice(i, i + n)); return o; };
      const qtpBus = (label, prefix, group) => {
        const nets = { SHIELD: 'GND' }; PAIR.forEach((p, i) => { const bb = group[i]; nets[p + '+'] = bb ? `${prefix}${pad2(bb)}+` : 'NC'; nets[p + '-'] = bb ? `${prefix}${pad2(bb)}-` : 'NC'; });
        sh.place('QTP', sx + 10.16, snap(sy), next('J'), label, nets); count('QTP RJ45'); sy += 38.1;
      };
      slots.forEach((s, si) => {
        if (s === 'SUM' || s === 'EMPTY') return;
        sh.text(`Slot ${si + 1}: ${SLOTS[s].label}`, sx, sy - 10.16, 2); sy += 7.62;
        if (s === 'INSERT') {
          buses.forEach(bus => { sh.place('M499', sx + 33.02, snap(sy + 5.08), next('U'), 'M499', { 'IN +': `RET${pad2(bus)}+`, 'IN -': `RET${pad2(bus)}-`, 'OUT +': `BUS${pad2(bus)}+`, 'OUT -': `BUS${pad2(bus)}-`, VCC: 'VCC', GND: 'GND' }); count('M499 insertion switcher'); sy += 33.02; });
          chunk(buses, 4).forEach(g => { qtpBus(`INSERT SEND ${g[0]}-${g[g.length - 1]}`, 'SEND', g); qtpBus(`INSERT RETURN ${g[0]}-${g[g.length - 1]}`, 'RET', g); });
        } else if (s === 'PATCH') {
          if (hasIns) chunk(buses, 4).forEach(g => { qtpBus(`PATCH TOP (sends) ${g[0]}-${g[g.length - 1]}`, 'SEND', g); qtpBus(`PATCH BOTTOM (returns) ${g[0]}-${g[g.length - 1]}`, 'RET', g); });
          else {
            chunk(buses, 4).forEach(g => { qtpBus(`PATCH TOP (bus out) ${g[0]}-${g[g.length - 1]}`, 'BUS', g); qtpBus(`PATCH BOTTOM (to row out) ${g[0]}-${g[g.length - 1]}`, 'BOUT', g); });
            sh.text('Half-normal: BOUT = BUS when nothing is patched', sx, sy, 1.5); sy += 5.08;
          }
          count('QTP-BITTREE patch card', Math.ceil(buses.length / 4));
        } else if (s === 'BIGVU') {
          chunk(buses, 2).forEach(g => { sh.place('BIGVU', sx + 22.86, snap(sy + 7.62), next('U'), `Big VU ${g.join('/')}`, { 'L+': `BUS${pad2(g[0])}+`, 'L-': `BUS${pad2(g[0])}-`, 'R+': g[1] ? `BUS${pad2(g[1])}+` : 'NC', 'R-': g[1] ? `BUS${pad2(g[1])}-` : 'NC' }); count('Big VU (RD87)'); sy += 33.02; });
        } else {
          const S = SYM[SLOTS[s].sym], ref = next('U');
          const ins = S.pins.map((p, i) => [p, i]).filter(([p]) => p.type === 'input').slice(0, 4);
          const outs = S.pins.map((p, i) => [p, i]).filter(([p]) => p.type === 'output').slice(0, 4);
          const tag = ['INL+', 'INL-', 'INR+', 'INR-'], otag = ['OUTL+', 'OUTL-', 'OUTR+', 'OUTR-'];
          const nets = {}; ins.forEach(([p, i], j) => nets[i] = `P${ref}_${tag[j]}`); outs.forEach(([p, i], j) => nets[i] = `P${ref}_${otag[j]}`);
          sh.place(SLOTS[s].sym, sx + 55.88, snap(sy + 10.16), ref, s === 'DEESS' ? 'M466 De-esser' : SLOTS[s].sym, nets); count(SLOTS[s].note);
          sy += 45.72;
          const qn = { SHIELD: 'GND' };
          ['SUN', 'SKY'].forEach((p, j) => { qn[p + '+'] = `P${ref}_${j ? 'INR' : 'INL'}+`; qn[p + '-'] = `P${ref}_${j ? 'INR' : 'INL'}-`; });
          ['GRASS', 'EARTH'].forEach((p, j) => { qn[p + '+'] = `P${ref}_${j ? 'OUTR' : 'OUTL'}+`; qn[p + '-'] = `P${ref}_${j ? 'OUTR' : 'OUTL'}-`; });
          sh.place('QTP', sx + 10.16, snap(sy), next('J'), `${ref} PATCH (SUN/SKY in, GRASS/EARTH out)`, qn); count('QTP RJ45'); sy += 38.1;
        }
        sy += 10.16;
      });
      if (buses.length) {
        sh.text('Bus outputs', sx, sy, 2); sy += 12.7;
        chunk(buses, 4).forEach(g => qtpBus(`BUS OUT ${g[0]}-${g[g.length - 1]}`, patchOut ? 'BOUT' : 'BUS', g));
      }
    });
    return { name, sheets, bom, buses: b, cfg };
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
    const note = [`${design.name}: ${design.cfg.inputs} inputs x ${design.buses} summing buses, ${design.cfg.rows.length} rows of ${Math.max(...design.cfg.rows.map(r => r.length))} slots`,
      `Rows: ${design.cfg.rows.map((r, i) => `${i + 1}: ${r.map(s => SLOTS[s].label).join(' / ')}`).join('   ')}`,
      'Nets are global labels: IN = XLR inputs, FS/FR = M480B fader send / return through the B300/F300 strip, CH = channels on QTP,',
      'SUMN = summing nodes, SEND / RET = insert send / return, BUS = bus outputs, P<ref>_ = processor patch points. QTP pairs SUN, SKY, GRASS, EARTH.'];
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

  const API = { SLOTS, PAIR, defaultConfig, consoleName, busCount, build, serialize, zip, symbols: SYM };
  if (typeof module !== 'undefined') module.exports = API; else root.EC = API;
})(typeof window !== 'undefined' ? window : globalThis);
