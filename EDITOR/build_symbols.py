"""Build EDITOR/symbols.js: the KiCad symbols the console editor places.

    python3 build_symbols.py [path/to/WBSps.ca/2026/Engineering/KICAD]

Ward-Beck module symbols come from the archive (one .kicad_sym per module, pins from each
module's RTO connector data). EuroConsole's own parts (QTP RJ45, XLR, the B300/F300 channel
strip, the RD87 Big VU, a resistor) are defined here.
"""
import json, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
LIB = sys.argv[1] if len(sys.argv) > 1 else os.path.normpath(os.path.join(HERE, '../../../2026/Engineering/KICAD'))
MODULES = ['M480', 'M460', 'M470', 'M441', 'M480B', 'M450', 'M499', 'M462B', 'M466', 'M467', 'M405', 'M435']


def block(text, start):
    """Balanced (...) starting at text[start] == '('."""
    d = 0; i = start; q = False
    while i < len(text):
        c = text[i]
        if q:
            if c == '\\': i += 1
            elif c == '"': q = False
        elif c == '"': q = True
        elif c == '(': d += 1
        elif c == ')':
            d -= 1
            if d == 0: return text[start:i + 1]
        i += 1
    raise ValueError('unbalanced')


PIN = re.compile(r'\(pin (\w+) \w+ \(at ([-\d.]+) ([-\d.]+) (\d+)\) \(length ([\d.]+)\).*?\(name "([^"]*)".*?\(number "([^"]*)"', re.S)


def pins_of(sym):
    return [dict(type=t, x=float(x), y=float(y), a=int(a), name=n, num=num)
            for t, x, y, a, _l, n, num in PIN.findall(sym)]


def prop(k, v, y, hide=False):
    h = ' hide' if hide else ''
    return f'(property "{k}" "{v}" (at 0 {y} 0) (effects (font (size 1.27 1.27)){h}))'


def custom(name, ref, value, desc, w, h, left=(), right=(), top=(), bottom=(), body=None):
    """A box symbol. left/right/top/bottom = [(num, name, type)], 2.54 mm pitch."""
    P = []
    def side(lst, x, y0, a, dx=0, dy=-2.54):
        for i, (num, nm, ty) in enumerate(lst):
            P.append(f'(pin {ty} line (at {x + dx * i:.2f} {y0 + dy * i:.2f} {a}) (length 2.54) '
                     f'(name "{nm}" (effects (font (size 1.27 1.27)))) (number "{num}" (effects (font (size 1.27 1.27)))))')
    hw, hh = w / 2, h / 2
    side(left, -hw - 2.54, hh - 2.54, 0)
    side(right, hw + 2.54, hh - 2.54, 180)
    side(top, -(len(top) - 1) * 1.27, hh + 2.54, 270, dx=2.54, dy=0)
    side(bottom, -(len(bottom) - 1) * 1.27, -hh - 2.54, 90, dx=2.54, dy=0)
    gfx = body or f'(rectangle (start {-hw} {hh}) (end {hw} {-hh}) (stroke (width 0.254) (type default)) (fill (type background)))'
    return (f'(symbol "{name}" (pin_names (offset 1.016)) (exclude_from_sim no) (in_bom yes) (on_board yes)\n'
            f'  {prop("Reference", ref, hh + 5.08)}\n  {prop("Value", value, -hh - 5.08)}\n'
            f'  {prop("Footprint", "", 0, True)}\n  {prop("Datasheet", "", 0, True)}\n  {prop("Description", desc, 0, True)}\n'
            f'  (symbol "{name}_0_1" {gfx})\n  (symbol "{name}_1_1" {" ".join(P)})\n)')


QTP_PAIRS = [('2', 'SUN+'), ('1', 'SUN-'), ('4', 'SKY+'), ('5', 'SKY-'),
             ('6', 'GRASS+'), ('3', 'GRASS-'), ('8', 'EARTH+'), ('7', 'EARTH-')]
CUSTOM = {
    'QTP': custom('QTP', 'J', 'QTP RJ45', 'Quad Twisted Pair RJ45: 4 balanced channels (T568B pairs: SUN orange 2/1, SKY blue 4/5, GRASS green 6/3, EARTH brown 8/7), shell = ground',
                  10.16, 22.86, right=[(n, nm, 'passive') for n, nm in QTP_PAIRS], bottom=[('SH', 'SHIELD', 'passive')]),
    'XLR': custom('XLR', 'J', 'XLR-3F', 'Balanced input, XLR-3 female: 2 hot, 3 cold, 1 ground',
                  7.62, 7.62, right=[('2', 'HOT', 'passive'), ('3', 'COLD', 'passive')], bottom=[('1', 'GND', 'passive')]),
    'STRIP': custom('STRIP', 'U', 'B300/F300', 'EuroConsole channel strip: B300 Brain (ESP32-S3, encoders, Neopixels, buttons) + F300 Fader (POS, ONLY, SEL, fader, CH ON); DS1882 digitally controlled level between THAT 1246 receiver and THAT 1646 driver',
                    20.32, 17.78, left=[('1', 'IN+', 'input'), ('2', 'IN-', 'input')],
                    right=[('3', 'OUT+', 'output'), ('4', 'OUT-', 'output'), ('5', 'SDA', 'bidirectional'), ('6', 'SCL', 'bidirectional')],
                    top=[('7', '+12V', 'power_in'), ('8', '-12V', 'power_in')], bottom=[('9', 'GND', 'power_in')]),
    'FADER': custom('FADER', 'U', 'F300 Fader', 'EuroConsole fader module (F300): 60 mm Bourns fader, POS pan, ONLY, SEL, CH ON; DS1882 level between THAT 1246 / 1646; ESP32-S3 runs the channel over I2C',
                    20.32, 17.78, left=[('1', 'IN+', 'input'), ('2', 'IN-', 'input')],
                    right=[('3', 'OUT+', 'output'), ('4', 'OUT-', 'output'), ('5', 'SDA', 'bidirectional'), ('6', 'SCL', 'bidirectional')],
                    top=[('7', '+12V', 'power_in'), ('8', '-12V', 'power_in')], bottom=[('9', 'GND', 'power_in')]),
    'AUX4': custom('AUX4', 'U', 'Aux send x4', 'EuroConsole 4-way aux send: post-fader channel in, four DS1882-controlled send levels out (one QTP RJ45: SUN SKY GRASS EARTH = sends 1-4), set over I2C by the strip ESP32-S3',
                   20.32, 27.94, left=[('1', 'IN+', 'input'), ('2', 'IN-', 'input')],
                   right=[(str(3 + i), f'SEND{i // 2 + 1}{"+" if i % 2 == 0 else "-"}', 'output') for i in range(8)] + [('11', 'SDA', 'bidirectional'), ('12', 'SCL', 'bidirectional')],
                   top=[('13', '+12V', 'power_in'), ('14', '-12V', 'power_in')], bottom=[('15', 'GND', 'power_in')]),
    'BIGVU': custom('BIGVU', 'U', 'Big VU (RD87)', 'Big VU Meter RD87 REV 5: stereo line input, Arduino, 2 x 57 Neopixel towers with peak-hold dots',
                    17.78, 12.7, left=[('1', 'L+', 'input'), ('2', 'L-', 'input'), ('3', 'R+', 'input'), ('4', 'R-', 'input')],
                    top=[('5', '+12V', 'power_in')], bottom=[('6', 'GND', 'power_in')]),
    'R': ('(symbol "R" (pin_numbers hide) (pin_names (offset 0)) (exclude_from_sim no) (in_bom yes) (on_board yes)\n'
          f'  {prop("Reference", "R", 0)}\n  {prop("Value", "R", 0)}\n  {prop("Footprint", "", 0, True)}\n  {prop("Datasheet", "", 0, True)}\n'
          '  (symbol "R_0_1" (rectangle (start -1.016 -2.54) (end 1.016 2.54) (stroke (width 0.254) (type default)) (fill (type none))))\n'
          '  (symbol "R_1_1" (pin passive line (at 0 3.81 270) (length 1.27) (name "~" (effects (font (size 1.27 1.27)))) (number "1" (effects (font (size 1.27 1.27)))))'
          ' (pin passive line (at 0 -3.81 90) (length 1.27) (name "~" (effects (font (size 1.27 1.27)))) (number "2" (effects (font (size 1.27 1.27))))))\n)'),
}


def main():
    out = {}
    for m in MODULES:
        t = open(os.path.join(LIB, m + '.kicad_sym')).read()
        s = block(t, t.index(f'(symbol "{m}"'))
        desc = re.search(r'\(property "Description" "([^"]*)"', s)
        out[m] = dict(sexpr=s, pins=pins_of(s), source=f'2026/Engineering/KICAD/{m}.kicad_sym',
                      desc=(desc.group(1) if desc else '')[:160])
    for k, s in CUSTOM.items():
        out[k] = dict(sexpr=s, pins=pins_of(s), source='EuroConsole', desc='')
    js = ('/* generated by build_symbols.py: KiCad symbols for the EuroConsole editor */\n'
          'var EC_SYMBOLS = ' + json.dumps(out, indent=0) + ';\n'
          'if (typeof module !== "undefined") module.exports = EC_SYMBOLS;\n')
    open(os.path.join(HERE, 'symbols.js'), 'w').write(js)
    for k, v in out.items():
        print(f'{k:6s} {len(v["pins"]):3d} pins  {v["source"]}')


if __name__ == '__main__':
    main()
