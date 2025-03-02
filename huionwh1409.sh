#!/bin/sh
# huiowh1409.sh: configuration file for WH1409 on Ubuntu 20.04, run as: $ ./huionwh1409.sh

#Change DVI-I-1 to what monitor you want from running command: xrandr
BUILTIN_MONITOR="eDP-1-1"
EXTERNAL_MONITOR="HDMI-0"

# if grep $EXTERNAL_MONITOR "$(xrandr --listactivemonitors)"; then
#     MONITOR=$BUILTIN_MONITOR
# else
#     MONITOR=$EXTERNAL_MONITOR
# fi
MONITOR=$BUILTIN_MONITOR
echo "Monitor: $MONITOR"

# Get pad name, use "lsusb" or "xsetwacom list devices"
PAD_NAME='HID 256c:006e'

# get stylus ID
ID_STYLUS=$(xinput | grep "$PAD_NAME stylus" | cut -f 2 | cut -c 4-5)

echo "Stylus ID: $ID_STYLUS"

# map pad to external monitor
xinput map-to-output "$ID_STYLUS" "$MONITOR"
xsetwacom set "$PAD_NAME Pad pad" MapToOutput HEAD-0
xsetwacom set "$PAD_NAME stylus" MapToOutput HEAD-0

# Pad button mapping
xsetwacom set "$PAD_NAME Pad pad" button 16 key Ctrl z # undo
xsetwacom set "$PAD_NAME Pad pad" button 14 key Ctrl shift z # redo
xsetwacom set "$PAD_NAME Pad pad" button 15 key Tab # toggle fullscreen
xsetwacom set "$PAD_NAME Pad pad" button 13 key Ctrl s # save

xsetwacom set "$PAD_NAME Pad pad" button 12 key 4 # rotate 15 degrees CCW
xsetwacom set "$PAD_NAME Pad pad" button 11 key 6 # rotate 15 degrees CW
xsetwacom set "$PAD_NAME Pad pad" button 10 key Ctrl \\ # flip horizontally
xsetwacom set "$PAD_NAME Pad pad" button 9 key Ctrl Shift \\ # flip vertically

xsetwacom set "$PAD_NAME Pad pad" button 3 key + # flip horizontally
xsetwacom set "$PAD_NAME Pad pad" button 1 key - # flip vertically

xsetwacom set "$PAD_NAME stylus" button 3 key e # toggle eraser
xsetwacom set "$PAD_NAME stylus" Rotate HALF
xsetwacom set "$PAD_NAME stylus" PressureCurve 0 0 66 100

