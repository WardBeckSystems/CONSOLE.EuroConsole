"""Own the X CLIPBOARD on :77 with argv[1] for argv[2] seconds (serves TARGETS / UTF8_STRING / STRING / TEXT)."""
import sys, time
from Xlib import X, display, Xatom
from Xlib.protocol import event
text = sys.argv[1].encode(); secs = float(sys.argv[2]) if len(sys.argv) > 2 else 20
d = display.Display(':77'); w = d.screen().root.create_window(0, 0, 1, 1, 0, X.CopyFromParent)
A = lambda n: d.intern_atom(n)
CLIP, TARGETS, UTF8, TEXT = A('CLIPBOARD'), A('TARGETS'), A('UTF8_STRING'), A('TEXT')
w.set_selection_owner(CLIP, X.CurrentTime); d.flush()
end = time.time() + secs
while time.time() < end:
    while d.pending_events():
        e = d.next_event()
        if e.type == X.SelectionRequest:
            prop = e.property or e.target
            if e.target == TARGETS:
                e.requestor.change_property(prop, Xatom.ATOM, 32, [TARGETS, UTF8, Xatom.STRING, TEXT])
            elif e.target in (UTF8, Xatom.STRING, TEXT):
                e.requestor.change_property(prop, e.target, 8, text)
            else: prop = X.NONE
            e.requestor.send_event(event.SelectionNotify(time=e.time, requestor=e.requestor, selection=e.selection, target=e.target, property=prop))
            d.flush()
    time.sleep(0.02)
