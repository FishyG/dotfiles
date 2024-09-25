#!/bin/bash

# Get the cpu usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | \
            sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
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

keyboard_layout="Keybord:<span foreground='#ee44ff'> ${keyboard_layout//\"}</span>"
# keyboard_layout="Keybord: $keyboard_layout"

# sound_volume=$(amixer get Master | grep -o '\[[0-9]*%\]' | grep -o '[0-9]*' | sed -n '2p')
# printf -v sound_volume "Volume : %d%%" "$sound_volume"
#
# now_playing="$(playerctl metadata title 2> /dev/null) - $(playerctl metadata artist 2> /dev/null)"
# 
# if [[ "$now_playing" == "$(cat /tmp/temp_nowplaying)" ]]
# then
# 	if [[ "$(playerctl status 2> /dev/null)" == "Playing" ]]
# 	then
# 		now_playing=$(cat /tmp/temp_nowplaying_rotate)
# 		new_now_playing="${now_playing:1}${now_playing:0:1}"
# 		echo "$new_now_playing" > /tmp/temp_nowplaying_rotate
# 	else
# 		now_playing=$(cat /tmp/temp_nowplaying)
# 		echo "$now_playing " > /tmp/temp_nowplaying_rotate
# 	fi
# else
# 	echo $now_playing > /tmp/temp_nowplaying
# 	if [ "${#now_playing}" -lt 20 ]
# 	then
# 			printf -v now_playing "%-19s" "$now_playing"
# 	fi
# 	echo "$now_playing " > /tmp/temp_nowplaying_rotate
# fi
# 
# printf -v now_playing '%.20s' "$now_playing"
# printf -v now_playing "Now Playing : %20s" "$now_playing"

#echo "$now_playing | $sound_volume | $ram_usage | $cpu_usage | $linux_version | $date_formatted "
#
# echo "$ram_usage | $cpu_usage | $linux_version | $date_formatted <span font='VictorMono Nerd Font medium Italic 10'><span foreground='#ff0000ff'>$linux_version</span>test</span>"

echo "<span font='VictorMono Nerd Font medium Italic 10'>$ram_usage | $cpu_usage | $keyboard_layout | $linux_version | $date_formatted </span>"

