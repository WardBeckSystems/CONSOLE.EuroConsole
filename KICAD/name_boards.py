"""Give every board in KICAD/ its name: title block (title, rev, company, comments) + README.md table.
    python3 name_boards.py            (one process per board: pcbnew's settings manager allows one project)"""
import os, subprocess, sys
HERE = os.path.dirname(os.path.abspath(__file__))
NAMES = {  # folder: (title, rev, date, what, source)
    'B300_Front': ('B300 Brain - front PCB', '17.2', '2016-04-06', 'Neopixels, POD buttons, encoder shaft holes; placed on the HUI front panel REV 4.1', 'Encoder PCB REV 17.2 (2016 DCASSP)'),
    'B300_Main': ('B300 Brain - main side board', '17.2', '2016-04-06', '4 encoders (WBS 10-081), Arduino Mega, RS-485, DB9, DS1808; perpendicular to the panel', 'Encoder PCB REV 17.2 (2016 DCASSP)'),
    'F300_Fader': ('F300 Fader - fader PCB', '17.2', '2016-04-06', 'Bourns PTA6043 fader, ONLY / SEL / CH ON buttons; placed on the HUI front panel REV 4.1', 'Encoder PCB REV 17.2 (2016 DCASSP)'),
    'Maxim_Adapter_Board': ('DS1882 (Maxim) adapter', '1', '2016', 'Maxim DS1882 dual log digital potentiometer breakout', 'Maxim Adapter Board (2016 DCASSP)'),
    'QTP-BAC_14.1': ('QTP-BAC - four-channel QTP backplane', '14.1', '2016', 'SUN SKY GRASS EARTH on RJ45: transformers, XLR, BNC, euro blocks', 'QTP-BAC 14.1 (2016 DCASSP)'),
    'Big_VU_Meter_REV5': ('Big VU (RD87) - meter and driver', '5', '2021-05-23', 'stereo line in, Arduino Micro, 2 x 57 Neopixel towers', 'Big VU meter REV 5 (2021 APK)'),
    'QTP-BITTREE_Patchbay_REV2.1': ('QTP-BITTREE - patchbay card', '2.1', '2021-05-23', 'top-row and bottom-row QTP RJ45 on a Bittree patchbay connector', 'QTP-BITTREE PATCHBAY REV 2.1 (2021 APK)'),
    'QTP-NEUTRIK_D-hole': ('QTP-NEUTRIK - D-hole RJ45', '1', '2021-05-23', 'QTP RJ45 in a Neutrik D-hole', 'QTP-NEUTRIK D-hole (2021 APK)'),
    'Encoder_PCB_17.2': ('Encoder PCB - 2016 DCASSP sheet (source)', '17.2', '2016-04-06', 'the whole Eagle sheet: every board above plus documentation frames', 'Encoder PCB REV 17.2 (2016 DCASSP)'),
}

def one(folder):
    import pcbnew
    title, rev, date, what, src = NAMES[folder]
    f = os.path.join(HERE, folder, folder + '.kicad_pcb')
    sm = pcbnew.GetSettingsManager(); sm.LoadProject(f[:-10] + '.kicad_pro')
    b = pcbnew.LoadBoard(f); tb = b.GetTitleBlock()
    tb.SetTitle(title); tb.SetRevision(rev); tb.SetDate(date); tb.SetCompany('Ward-Beck Systems')
    tb.SetComment(0, what); tb.SetComment(1, 'From ' + src + ' - converted by tools/eagle2kicad_pcb.py')
    tb.SetComment(2, 'EuroConsole - Ward-Beck.com - Ward-Beck.ca')
    b.SetTitleBlock(tb); pcbnew.SaveBoard(f, b)
    print(f'{folder}: {title}', flush=True); os._exit(0)

if __name__ == '__main__':
    if len(sys.argv) > 1: one(sys.argv[1])
    rows = []
    for k, (title, rev, date, what, src) in NAMES.items():
        r = subprocess.run([sys.executable, __file__, k], capture_output=True, text=True)
        print(r.stdout.strip() or f'{k}: FAILED {r.stderr.strip().splitlines()[-1:]}')
        rows.append(f'| [{title}]({k}/) | {rev} | {what} | {src} |')
    open(os.path.join(HERE, 'README.md'), 'w').write(
        '# EuroConsole boards (KiCad 9)\n\n| Board | Rev | What it is | From |\n|---|---|---|---|\n' + '\n'.join(rows) +
        '\n\nEach board carries its name in the title block. `split_boards.py` splits the Encoder sheet per module in panel coordinates; `name_boards.py` writes these names.\n')
