# LCD: HD44780

### 3V<->5V converter nem kell
 (raspberry tudja lezelni az 5V-os bemenetet I2C buszon, asszem ezért...)

### Az I2C átalakító lábkiosztása:

```
chip: PCF8574
 LCD: HD44780

        chip - LCD
-------------------
 0x80    P7  -  D7
 0x40    P6  -  D6
 0x20    P5  -  D5
 0x10    P4  -  D4
-------------------
 0x08    P3  -  BL   Backlight ???
 0x04    P2  -  EN   Starts Data read/write
 0x02    P1  -  RW   low: write, high: read
 0x01    P0  -  RS   Register Select: 0: Instruction Register (IR) (AC when read), 1: data register (DR)
```

