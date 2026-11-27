"""tiny X11 driver for the Xvfb display :77: click x y | key combo | type text | shot name | wait secs"""
import sys, time, subprocess, os
from Xlib import X, XK, display
from Xlib.ext import xtest
d = display.Display(':77'); S = os.path.dirname(os.path.abspath(__file__))
def kc(name):
    ks = XK.string_to_keysym(name)
    if ks == 0 and len(name) == 1: ks = ord(name)
    return d.keysym_to_keycode(ks)
SHIFTED = set('~!@#$%^&*()_+{}|:"<>?ABCDEFGHIJKLMNOPQRSTUVWXYZ')
NAMES = {' ': 'space', '/': 'slash', '-': 'minus', '.': 'period', '_': 'underscore', ':': 'colon', '(': 'parenleft', ')': 'parenright', '|': 'bar', '#': 'numbersign', ',': 'comma', '&': 'ampersand', "'": 'apostrophe', '+': 'plus', '=': 'equal', '~': 'asciitilde', '[': 'bracketleft', ']': 'bracketright'}
def press(code, down): xtest.fake_input(d, X.KeyPress if down else X.KeyRelease, code); d.sync()
def combo(c):
    keys = [kc({'ctrl': 'Control_L', 'alt': 'Alt_L', 'shift': 'Shift_L'}.get(k, k)) for k in c.split('+')]
    for k in keys: press(k, True)
    for k in reversed(keys): press(k, False)
    time.sleep(0.15)
def typ(t):
    for ch in t:
        name = NAMES.get(ch, ch); code = kc(name); sh = ch in SHIFTED
        if sh: press(kc('Shift_L'), True)
        press(code, True); press(code, False)
        if sh: press(kc('Shift_L'), False)
        pass
def click(x, y, b=1):
    xtest.fake_input(d, X.MotionNotify, x=x, y=y); d.sync(); time.sleep(0.1)
    xtest.fake_input(d, X.ButtonPress, b); d.sync(); xtest.fake_input(d, X.ButtonRelease, b); d.sync(); time.sleep(0.3)
a = sys.argv[1:]
while a:
    c = a.pop(0)
    if c == 'click': click(int(a.pop(0)), int(a.pop(0)))
    elif c == 'key': combo(a.pop(0))
    elif c == 'type': typ(a.pop(0))
    elif c == 'wait': time.sleep(float(a.pop(0)))
    elif c == 'shot': subprocess.run(['import', '-window', 'root', os.path.join(S, a.pop(0) + '.png')], env=dict(os.environ, DISPLAY=':77'))
