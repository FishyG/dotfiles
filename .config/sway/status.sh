#!/bin/bash

# Set locale to UTF-8
export LANG=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8

# Get the cpu usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" |
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" |
    awk '{print 100 - $1}')

cpu_color="'#$(printf '%02x' $(expr ${cpu_usage%.*} \* 5 / 2))$(printf '%02x' $(expr 250 - ${cpu_usage%.*} \* 5 / 2))00'"
printf -v cpu_usage "CPU:<span foreground=$cpu_color>%5s%%</span>" "$cpu_usage"

# Get the ram usage
ram_usage=$(free | grep Mem | awk '{printf "%.1f", ($3/$2 * 100.0)}')
ram_color="'#$(printf '%02x' $(expr ${ram_usage%.*} \* 5 / 2))$(printf '%02x' $(expr 250 - ${ram_usage%.*} \* 5 / 2))00'"
# printf -v ram_usage "RAM:<span foreground=$ram_color> %.1f%%</span>" "$ram_usage"
printf -v ram_usage "RAM:<span foreground=%s> %s%%</span>" "$ram_color" "$ram_usage"

# Get and format date like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date +'%Y-%m-%d %I:%M:%S %p')

# Get the Linux version but remove the "-1-ARCH" part
linux_version="$(uname -s):<span foreground='#ee44ff'> $(uname -r | cut -d '-' -f1)</span>"

keyboard_layout=$(swaymsg -t get_inputs | jq '.[0].xkb_active_layout_name')

keyboard_layout="Keybord:<span foreground='#ee44ff'> ${keyboard_layout//\"/}</span>"

# sound_volume=$(amixer get Master | grep -o '\[[0-9]*%\]' | grep -o '[0-9]*' | sed -n '2p')
# printf -v sound_volume "Volume : %d%%" "$sound_volume"

NOW_PLAYING_TITLE=$(playerctl metadata title 2>/dev/null | sed 's/&/\&amp;/g')
NOW_PLAYING_ARTIST=$(playerctl metadata artist 2>/dev/null | sed 's/&/\&amp;/g')
NOW_PLAYING="$NOW_PLAYING_TITLE - $NOW_PLAYING_ARTIST"
PREVIOUS_NOW_PLAYING=$(cat /tmp/temp_nowplaying 2>/dev/null)

# Player status
PLAYER_STATUS=$(playerctl status 2>/dev/null)

# Rotate the song if it's still the same
if [[ "$NOW_PLAYING" == "$PREVIOUS_NOW_PLAYING" ]]; then
    if [[ "$PLAYER_STATUS" == "Playing" ]]; then
        NOW_PLAYING=$(cat /tmp/temp_nowplaying_rotate)
        NEW_NOW_PLAYING="${NOW_PLAYING:1}${NOW_PLAYING:0:1}"
        echo -e "$NEW_NOW_PLAYING" >/tmp/temp_nowplaying_rotate
    else
        NOW_PLAYING="$PREVIOUS_NOW_PLAYING"
        echo -e "$NOW_PLAYING" >/tmp/temp_nowplaying_rotate
    fi
else
    echo $NOW_PLAYING > /tmp/temp_nowplaying
    if [ "${#NOW_PLAYING}" -lt 20 ]; then
        printf -v NOW_PLAYING "%-19s \u200B" "$NOW_PLAYING"
    fi
    echo "$NOW_PLAYING " >/tmp/temp_nowplaying_rotate
fi

# Display now playing only if title is available
if [[ -n $NOW_PLAYING_TITLE ]]; then
    printf -v NOW_PLAYING '%.20s' "$NOW_PLAYING"
    printf -v NOW_PLAYING "Now Playing :<span foreground='#ee44ff'> %20s </span>| " "$NOW_PLAYING"
else
    # Clear now playing (show nothing)
    NOW_PLAYING=""
fi

echo -e "<span font='VictorMono Nerd Font medium Italic 10'>${NOW_PLAYING}\u200B$ram_usage | $cpu_usage | $keyboard_layout | $linux_version | $date_formatted </span>"
