# EuroConsole boards (KiCad 9)

| Board | Rev | What it is | From |
|---|---|---|---|
| [B300 Brain - front PCB](B300_Front/) | 17.2 | Neopixels, POD buttons, encoder shaft holes; placed on the HUI front panel REV 4.1 | Encoder PCB REV 17.2 (2016 DCASSP) |
| [B300 Brain - main side board](B300_Main/) | 17.2 | 4 encoders (WBS 10-081), Arduino Mega, RS-485, DB9, DS1808; perpendicular to the panel | Encoder PCB REV 17.2 (2016 DCASSP) |
| [F300 Fader - fader PCB](F300_Fader/) | 17.2 | Bourns PTA6043 fader, ONLY / SEL / CH ON buttons; placed on the HUI front panel REV 4.1 | Encoder PCB REV 17.2 (2016 DCASSP) |
| [DS1882 adapter](DS1882_Adapter/) | 17.2 | Maxim DS1882 dual log digital potentiometer breakout | Encoder PCB REV 17.2 (2016 DCASSP) |
| [QTP-BAC - four-channel QTP backplane](QTP-BAC_14.1/) | 14.1 | SUN SKY GRASS EARTH on RJ45: transformers, XLR, BNC, euro blocks | QTP-BAC 14.1 (2016 DCASSP) |
| [Big VU (RD87) - meter and driver](Big_VU_Meter_REV5/) | 5 | stereo line in, Arduino Micro, 2 x 57 Neopixel towers | Big VU meter REV 5 (2021 APK) |
| [QTP-BITTREE - patchbay card](QTP-BITTREE_Patchbay_REV2.1/) | 2.1 | top-row and bottom-row QTP RJ45 on a Bittree patchbay connector | QTP-BITTREE PATCHBAY REV 2.1 (2021 APK) |
| [QTP-NEUTRIK - D-hole RJ45](QTP-NEUTRIK_D-hole/) | 1 | QTP RJ45 in a Neutrik D-hole | QTP-NEUTRIK D-hole (2021 APK) |
| [Encoder PCB - 2016 DCASSP sheet (source)](Encoder_PCB_17.2/) | 17.2 | the whole Eagle sheet: every board above plus documentation frames | Encoder PCB REV 17.2 (2016 DCASSP) |

Each board carries its name in the title block. `split_boards.py` splits the Encoder sheet per module in panel coordinates; `name_boards.py` writes these names.
