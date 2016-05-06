#!/bin/bash
if [ -a /sys/class/backlight/intel_backlight/brightness ]
  then
    b=$(cat /sys/class/backlight/intel_backlight/brightness)
    m=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    bc <<< "scale=2;($b/$m)*100+1" | grep -o '^.[0-9]*'
  else
    echo -
fi
