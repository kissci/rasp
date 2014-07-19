#!/usr/bin/python

from bmp180inc import BMP085

from time import gmtime, strftime
import datetime

import os
import errno

# ===========================================================================
# Example Code
# ===========================================================================

# Initialise the BMP085 and use STANDARD mode (default value)
#bmp = BMP085(0x77, debug=True)
bmp = BMP085(0x77)

# To specify a different operating mode, uncomment one of the following:
# bmp = BMP085(0x77, 0)  # ULTRALOWPOWER Mode
# bmp = BMP085(0x77, 1)  # STANDARD Mode
# bmp = BMP085(0x77, 2)  # HIRES Mode
# bmp = BMP085(0x77, 3)  # ULTRAHIRES Mode

temp = bmp.readTemperature()

# Read the current barometric pressure level
#pressure = bmp.readPressure(102)
pressure = bmp.readPressure()

# To calculate altitude based on an estimated mean sea level pressure
# (1013.25 hPa) call the function as follows, but this won't be very accurate
#altitude = bmp.readAltitude()
# To specify a more accurate altitude, enter the correct mean sea level
# pressure level.  For example, if the current pressure level is 1023.50 hPa
# enter 102350 since we include two decimal places in the integer value
#altitude = bmp.readAltitude(100950)
altitude = bmp.readAltitude()

p_calc = (pressure+((102/10)*1.2)*100)/100


filepath = "/home/pi/WS/data/"+datetime.datetime.now().strftime("%Y")+"/"+datetime.datetime.now().strftime("%m")+"/"
if not os.path.exists(filepath):
    os.makedirs(filepath)

with open(filepath+"bmp180."+datetime.datetime.now().strftime("%Y%m%d")+".csv", "a") as myfile:
	myfile.write(datetime.datetime.now().strftime("%s;"))
	myfile.write( "%.2f;" % temp)
	myfile.write( "%.2f\n" % p_calc)

with open("/var/www/data/bmp180.act.csv", "w") as myfile1:
#	myfile1.write(datetime.datetime.now().strftime("%Y.%m.%d. %H:%M:%S;"))
	myfile1.write(datetime.datetime.now().strftime("%s;"))
	myfile1.write( "%.1f;" % temp)
	myfile1.write( "%.1f\n" % p_calc)

print "Temperature:	%.2f C" % temp
print "Pressure:	%.2f hPa" % (pressure / 100.0)
print "Calc Pressure:	%.2f hPa" % (p_calc)
print "Altitude:	%.2f" % altitude
