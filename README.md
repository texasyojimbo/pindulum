# pindulum
Simple bash script for controlling LEDs on Raspberry PI 

Requirements
------------
1.) This was written for the Raspberry Pi 2B running Raspbian "Jessie". YMMV with other hardward/software.

2.) You must already have set up at least one GPIO pin.
Based on how-to located here: http://visualgdb.com/tutorials/raspberry/LED/
Steps:
  sudo su
  cd /sys/class/gpio
  echo [pinNumber] > export
  cd gpio[pinNumber]
  echo out > direction
* Note: you will need to do this each time you reboot the system.
* See create_gpio_pin.sh script to automate this (first parameer must be the pin number).

Parameters
----------
1.) Pin Number (default 27)
2.) Frequency (default 1)
3.) Number of Times to Blink (default 1000)
4.) Exit Code (default 0)


Example 
-------
Using Canakit breakout board, take jumper from pin 27 to 220 ohm resistor. Then on the same row as resistor out, add an LED. Terminate the LED to ground (3.3V negative).

Make pindulum.sh and call it:

./pindulum.sh 27 1 10 0

LED should blink on and off once per second 10 times.
