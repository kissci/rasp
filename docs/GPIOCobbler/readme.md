```
Cobbler PINs:          GPIO Pins:
    ┌──┐                  ┌──┐
 CE1│**│p0        3.3V   1│oo│2   5V
 CE0│**│p1         SDA   3│oo│4   -
SCLK│**│p2         SDL   5│oo│6   GND
MISO│**│p3          P7   7│oo│8   TxD
MOSI│**│p4         GND   9│oo│10  TxD
 RxD│**│p5          P0  11│oo│12  P1
 TxD│**│p6          P2  13│oo│14  GND
 SCL│**│p7          P3  15│oo│16  P4
 SDA│**│GND       3.3V  17│oo│18  P5
    └──┘          MOSI  20│oo│20  GND
                  MISO  22│oo│22  P6
                  SCLK  24│oo│24  CE0
                   GND  26│oo│26  CE1
                          └──┘
```