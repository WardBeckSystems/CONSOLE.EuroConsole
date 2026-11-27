# EuroConsole software

## DCASSP: the channel-strip firmware (2016|49)

[`DCASSP/firmware/TPJ_sketch_mar19a/TPJ_sketch_mar19a.ino`](DCASSP/firmware/TPJ_sketch_mar19a/TPJ_sketch_mar19a.ino) is the final firmware of the 2016|49 Digitally Controlled Analog Surround Sound Panner (Arduino Mega, 1,526 lines). It is the code for the B300 / F300 controls that EuroConsole's modules grow from:

| In the code | In EuroConsole |
|---|---|
| `FNT_POT_SUN/SKY/GRASS/EARTH`, `FNT_KEY_*`, `FNT_LED_KEY_*` | the four aux encoders, buttons and their LEDs (B300 face: the Aux 1-4 / Aux 5-8 / M 1-4 send banks) |
| `FNT_NEO_PIXEL_*`, `UpdateNeopixel()` | the Neopixels: SEL, SUN, SKY, GRASS, EARTH |
| `FDR_POT_POSITION`, `FDR_POT_SLIDE`, `FDR_KEY_CHON/ONLY/SEL` | the F300 fader bank: POS pan, fader, CH ON, ONLY, SEL |
| `ChangePot()`, `PotScale()` over `Wire` (I2C) | the DS1882 digitally controlled potentiometers, pan law and fader scaling |
| `PodInput()` | input select through the WBS POD 2 switcher (RS-422) |

- [`DCASSP/history/`](DCASSP/history/): 24 dated snapshots, from *first working pot* (160323) to *ready to present* (160403)
- [`DCASSP/firmware/SERIAL_PORT_TESTING`](DCASSP/firmware/SERIAL_PORT_TESTING/): the serial-port test sketch
- [`DCASSP/pan-law/`](DCASSP/pan-law/): the pan-law spreadsheets (2016-02-03) behind the 64-step DS1882 table
- [`DCASSP/encoder NETLIST RAW.txt`](DCASSP/encoder%20NETLIST%20RAW.txt): the Encoder PCB netlist the pin map comes from
- [`DCASSP/interface/TPJ interface`](DCASSP/interface/): the PC interface (Visual Basic .NET, Visual Studio solution; build output left out)

## Big VU (RD87): the meter firmware

The Big VU sketches drive Neopixel bar meters from a line input (2 × 57 pixels, log scale, calibration, falling peak dots, ceiling pot). In EuroConsole the same code runs **every vertical meter**: the Big VU banks on the masters and the vertical VU meter under each preamp section of the quad preamp. Each distinct version is kept once, tagged with its hash:

| Version | Notes |
|---|---|
| [working version (APK)](BigVU/) `bcd867` | the current one (same as in `PRODUCTS.BigVU`, APK WORKING VERSION) |
| 150610a best looking, calibrated `afd942` `b02f31` `0d748b` | "best looking and calibrated SLM meter imitation", three saves |
| arduino micro, post MMVA `0a7d83` | the Arduino Micro build |
| Ward_Beck_VU, NAB 2015 backup `cf50c8` | the NAB 2015 version |
| archive `8e99ef` | an archive copy |

Source: [`PRODUCTS.BigVU`](https://github.com/WardBeckSystems/PRODUCTS.BigVU) (`Big VU - #Software`).

## Next

Both move to the ESP32-S3 in each bank module (roadmap step 1 and 6): the DCASSP pin map becomes the bank's I2C / GPIO map, and the Big VU loop runs per channel for the quad preamp meters.

---
© Ward-Beck Systems (Ward-Beck.com - Ward-Beck.ca) · archive by Anthony Peter Kuzub
