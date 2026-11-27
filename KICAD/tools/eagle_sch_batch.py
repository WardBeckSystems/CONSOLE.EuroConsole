"""Convert Eagle .sch -> .kicad_sch with eeschema's own importer on Xvfb :77 (eeschema already running).
    batch.py <outroot> <src.sch>=<Name> ..."""
import os, shutil, subprocess, sys, time
S = os.path.dirname(os.path.abspath(__file__)); PY = os.path.join(S, '..', 'venv', 'bin', 'python')
drv = lambda *a: subprocess.run([PY, os.path.join(S, 'drv.py'), *map(str, a)])
out = sys.argv[1]
for spec in sys.argv[2:]:
    src, name = spec.rsplit('=', 1)
    d = os.path.join(out, name); os.makedirs(d, exist_ok=True)
    tgt = os.path.join(d, name + '.sch'); shutil.copy(src, tgt)
    kic = os.path.join(d, name + '.kicad_sch')
    if os.path.exists(kic): os.remove(kic)
    wait = 6 + os.path.getsize(src) / 40000
    ee = subprocess.Popen(['eeschema'], env=dict(os.environ, DISPLAY=':77'), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    time.sleep(9)                                    # a fresh eeschema each time: no 'replace current schematic?' prompt
    clip = subprocess.Popen([PY, os.path.join(S, 'clip.py'), tgt, '120'])
    drv('click', 950, 300, 'click', 178, 153, 'wait', 0.6, 'click', 213, 344, 'key', 'Right', 'wait', 0.5, 'key', 'Return', 'wait', 3.5,
        'key', 'ctrl+l', 'wait', 0.3, 'key', 'ctrl+a', 'key', 'ctrl+v', 'wait', 1.0, 'shot', f'path-{name}', 'key', 'Return', 'wait', wait, 'shot', f'imp-{name}', 'key', 'Escape', 'wait', 0.5,
        'click', 950, 300, 'key', 'ctrl+s', 'wait', 3)
    for _ in range(20):
        if os.path.exists(kic): break
        time.sleep(1)
    ok = os.path.exists(kic)
    if not ok: drv('shot', f'fail-{name}')
    clip.kill(); ee.terminate()
    try: ee.wait(10)
    except subprocess.TimeoutExpired: ee.kill()
    time.sleep(1)
    print(f'{name}: {"OK " + str(os.path.getsize(kic)) if ok else "FAILED"}', flush=True)
