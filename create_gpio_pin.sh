#!/bin/bash

cd /sys/class/gpio
echo $1 > export
cd /sys/class/gpio/gpio$1
echo out > direction
