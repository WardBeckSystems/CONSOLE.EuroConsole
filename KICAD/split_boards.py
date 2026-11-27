"""Split the 2016 Eagle 'Encoder PCB - REV 17.2' (converted to KiCad) into its separate boards,
each placed in the coordinates of the HUI front panel REV 4.1 drawing (6HP x 3U plates).

    python3 split_boards.py            # from Console/EuroConsole/KICAD

KiCad coordinates of every output: panel origin = plate bottom-left, X right, Y down,
so KiCad (x, y) = (panel_x, 128.5 - panel_y) + ORIGIN offset.  The panel plate, its
cut-outs and every control from the drawing are drawn on User.Drawings (Dwgs.User) so the
board can be checked against the panel, and check() reports each control's distance to its hole.
"""
import math, os, sys
import pcbnew

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, 'Encoder_PCB_17.2', 'Encoder_PCB_17.2.kicad_pcb')
MM = pcbnew.FromMM
ORIGIN = (50.0, 50.0)            # where the panel plate's top-left lands on the KiCad sheet
H = 128.5                        # 3U plate height
W = 30.0                         # 6HP plate width (drawing: 29.97 / 30.0)

# Panel drawing (HUI front panel REV 4.1.dxf, inches -> mm), each plate in its own origin.
PANELS = {
    'B300': {
        'holes': [  # (name, x, y, diameter)
            ('INPUT LED', 10.16, 116.84, 3.17),
            ('SUN LED', 22.86, 101.6, 3.17), ('SKY LED', 22.86, 76.2, 3.17),
            ('GRASS LED', 22.86, 50.8, 3.17), ('EARTH LED', 22.86, 25.4, 3.17),
            ('SUN encoder', 10.16, 101.6, 6.0), ('SKY encoder', 10.16, 76.2, 6.0),
            ('GRASS encoder', 10.16, 50.8, 6.0), ('EARTH encoder', 10.16, 25.4, 6.0),
            ('SEL button', 22.86, 116.84, 10.2), ('SUN button', 22.86, 91.44, 10.2),
            ('SKY button', 22.86, 66.04, 10.2), ('GRASS button', 22.86, 40.64, 10.2),
            ('EARTH button', 22.86, 15.24, 10.2),
            ('rail screw', 15.0, 3.0, 3.0), ('rail screw', 15.0, 126.14, 3.0),
        ],
        'pcb': [(0, 7.62), (29.97, 7.62), (29.97, 120.9), (0, 120.9)],
        'slot': None,
    },
    'F300': {   # plate x 76.2..106.17 in the drawing, shifted to 0
        'holes': [
            ('POS encoder', 14.99, 113.28, 6.0),
            ('ONLY button', 7.62, 99.06, 10.2), ('SEL button', 22.35, 99.06, 10.2),
            ('CH ON button', 14.99, 12.7, 10.2),
            ('fader screw', 10.79, 88.47, 1.7), ('fader screw', 19.18, 87.32, 1.7),
            ('fader screw', 10.79, 23.44, 1.7), ('fader screw', 19.18, 24.59, 1.7),
            ('rail screw', 15.0, 3.0, 3.0), ('rail screw', 15.0, 126.14, 3.0),
        ],
        'pcb': [(0, 7.62), (29.97, 7.62), (29.97, 106.68), (8.38, 106.68), (8.38, 120.9), (0, 120.9)],
        'slot': (13.98, 23.64, 16.02, 89.94),   # fader slot x0,y0,x1,y1
    },
}

# Regions of the source board (KiCad mm, y down): bbox and how to bring it into panel coords.
# transform(x, y) -> (panel_x, panel_y)
BOARDS = {
    'B300_Front': dict(box=(-1, -122, 31, -6), panel='B300',
                       transform=lambda x, y: (x, -y)),
    'F300_Fader': dict(box=(22, 14, 138, 46), panel='F300',
                       transform=lambda x, y: (45.09 - y, 144.14 - x)),
    'B300_Main':  dict(box=(54, -122, 191, -6), panel=None,       # perpendicular side board,
                       transform=lambda x, y: (x - 55.88, -y)),    # front edge at x=0
}


def kpt(px, py):
    return pcbnew.VECTOR2I(MM(ORIGIN[0] + px), MM(ORIGIN[1] + H - py))


def inside(item, box):
    x0, y0, x1, y1 = (MM(v) for v in box)
    if isinstance(item, pcbnew.FOOTPRINT):     # by position: labels may hang outside the board
        p = item.GetPosition(); return x0 <= p.x <= x1 and y0 <= p.y <= y1
    bb = item.GetBoundingBox()
    return bb.GetLeft() >= x0 and bb.GetRight() <= x1 and bb.GetTop() >= y0 and bb.GetBottom() <= y1


def all_items(b):
    return (list(b.GetFootprints()) + list(b.GetTracks()) + list(b.GetDrawings())
            + [b.GetArea(i) for i in range(b.GetAreaCount())])


def move_all(items, tf):
    """Apply tf (an affine map: rotation by a multiple of 90 deg + translation, no mirror) to every item."""
    # find the rotation from tf's linear part
    o = tf(0, 0); ex = tf(1, 0)
    ang = math.degrees(math.atan2(ex[1] - o[1], ex[0] - o[0]))   # panel y-up = KiCad's CCW-positive
    ang = round(ang / 90) * 90
    zero = pcbnew.VECTOR2I(0, 0)
    for it in items:
        if ang:
            it.Rotate(zero, pcbnew.EDA_ANGLE(ang, pcbnew.DEGREES_T))
    # after rotation, the point (0,0) still maps to tf(0,0): translate
    t = kpt(*o)
    for it in items:
        it.Move(t)
    return ang


def draw(b, layer, pts=None, circle=None, closed=True, width=0.1):
    if circle:
        (cx, cy, d) = circle
        s = pcbnew.PCB_SHAPE(b); s.SetShape(pcbnew.SHAPE_T_CIRCLE)
        s.SetCenter(kpt(cx, cy)); s.SetEnd(kpt(cx + d / 2, cy))
        s.SetLayer(layer); s.SetWidth(MM(width)); b.Add(s); return
    seq = pts + ([pts[0]] if closed else [])
    for a, c in zip(seq, seq[1:]):
        s = pcbnew.PCB_SHAPE(b); s.SetShape(pcbnew.SHAPE_T_SEGMENT)
        s.SetStart(kpt(*a)); s.SetEnd(kpt(*c)); s.SetLayer(layer); s.SetWidth(MM(width)); b.Add(s)


def text(b, layer, s, px, py, size=1.2):
    t = pcbnew.PCB_TEXT(b); t.SetText(s); t.SetPosition(kpt(px, py)); t.SetLayer(layer)
    t.SetTextSize(pcbnew.VECTOR2I(MM(size), MM(size))); b.Add(t)


def panel_overlay(b, P, name):
    L = pcbnew.Dwgs_User
    draw(b, L, [(0, 0), (W, 0), (W, H), (0, H)])                       # plate
    draw(b, pcbnew.Cmts_User, P['pcb'], width=0.05)                     # PCB outline per drawing
    for (n, x, y, d) in P['holes']:
        draw(b, L, circle=(x, y, d))
    if P['slot']:
        x0, y0, x1, y1 = P['slot']; draw(b, L, [(x0, y0), (x1, y0), (x1, y1), (x0, y1)])
    text(b, L, f'{name} panel (HUI front panel REV 4.1) - User.Drawings', W / 2, H + 3)


def check(b, P):
    """Nearest footprint (by its pads' centre) to every panel hole."""
    rows = []
    fps = [(f.GetReference(), f) for f in b._fps]
    for (n, x, y, d) in P['holes']:
        c = kpt(x, y); best = None
        for ref, f in fps:
            if not f.Pads(): continue
            bb = f.GetBoundingBox(False, False)
            pc = bb.GetCenter()
            dist = math.hypot(pc.x - c.x, pc.y - c.y) / 1e6
            if best is None or dist < best[0]: best = (dist, ref, f.GetValue())
        rows.append((n, x, y, best))
    return rows


def main(names):
    sm = pcbnew.GetSettingsManager()
    report, boards = [], []
    for name in names:
        spec = BOARDS[name]
        b = pcbnew.LoadBoard(SRC)
        box = spec['box']
        keep, gone = [], []      # removed items must stay referenced: if Python frees them the board corrupts
        for it in all_items(b):
            if inside(it, box): keep.append(it)
            else: b.Remove(it); gone.append(it)
        b._gone = gone
        ang = move_all(keep, spec['transform'])
        b._fps = [i for i in keep if isinstance(i, pcbnew.FOOTPRINT)]
        P = PANELS.get(spec['panel'])
        if P:
            panel_overlay(b, P, spec['panel'])
        out_dir = os.path.join(HERE, name); os.makedirs(out_dir, exist_ok=True)
        out = os.path.join(out_dir, name + '.kicad_pcb')
        sm.LoadProject(os.path.join(out_dir, name + '.kicad_pro')); b.SetProject(sm.Prj())
        pcbnew.SaveBoard(out, b)
        bb = b.GetBoardEdgesBoundingBox()
        boards.append(b)
        report.append(f'## {name}: {sum(isinstance(i, pcbnew.FOOTPRINT) for i in keep)} footprints, '
                      f'{sum(isinstance(i, pcbnew.PCB_TRACK) for i in keep)} tracks+vias, '
                      f'{sum(isinstance(i, pcbnew.ZONE) for i in keep)} zones, rotated {ang} deg, '
                      f'{bb.GetWidth()/1e6:.2f} x {bb.GetHeight()/1e6:.2f} mm')
        if P:
            for (n, x, y, best) in check(b, P):
                d, ref, val = best
                flag = 'ok' if d < 0.6 else ('near' if d < 3 else 'NO PART')
                report.append(f'  {n:14s} ({x:6.2f},{y:6.2f})  {ref:18s} {val[:18]:18s} {d:6.2f} mm  {flag}')
    print('\n'.join(report), flush=True)
    os._exit(0)     # skip pcbnew teardown (asserts/crashes on exit)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        main(sys.argv[1:])
    else:   # one process per board: KiCad's settings manager crashes on a second LoadProject
        import subprocess
        for n in BOARDS:
            r = subprocess.run([sys.executable, __file__, n], capture_output=True, text=True)
            print(r.stdout, end='')
            if not r.stdout.strip():
                print(f'## {n}: FAILED', r.stderr.strip().splitlines()[-1:])
