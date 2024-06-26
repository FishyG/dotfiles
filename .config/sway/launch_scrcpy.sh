#!/bin/bash

# Launch scrcpy with the device specified by autoadb
scrcpy -s "$1" --turn-screen-off &

# Wait for scrcpy to potentially initialize and update the sway tree
sleep 2

# Fetch the window title of the scrcpy instance
SCRCPY_DEVICE=$(swaymsg -t get_tree | grep --after-context=1 "instance\": \"scrcpy\"" | grep title | awk -F '"' '{print $4}')

# Send the notification with the fetched title
notify-send -t 2000 "$SCRCPY_DEVICE connected"

