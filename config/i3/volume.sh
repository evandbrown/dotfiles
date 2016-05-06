#!/bin/bash
#awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master)
#amixer get IEC958 | egrep -o "[0-9]+%" -m 1
awk -F"[][]" '/dB/ { print $2 }' <(amixer -c 1 sget Master)
