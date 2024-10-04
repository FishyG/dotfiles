#!/bin/bash

swaymsg -m -t subscribe '["input"]' | jq --unbuffered -r '.input.xkb_active_layout_name' | {
    previous_layout=""
    while read -r layout; do if [[ "$layout" != "$previous_layout" ]]; then
        notify-send -t 2000 "Keyboard: $layout"
        previous_layout="$layout"
    fi; done
}
