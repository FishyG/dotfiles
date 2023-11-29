#!/bin/bash

# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date +'%Y-%m-%d %I:%M:%S %p')

# Get the Linux version but remove the "-1-ARCH" part
linux_version="$(uname -s) $(uname -r | cut -d '-' -f1)"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
		   awk '{print 100 - $1"%"}')
printf -v cpu_usage "CPU :%6s" "$cpu_usage"

now_playing="$(playerctl metadata title) - $(playerctl metadata artist)" 

if [[ "$now_playing" == "$(cat /tmp/temp_nowplaying)" ]]
then
	if [[ "$(playerctl status)" == "Playing" ]]
	then
		now_playing=$(cat /tmp/temp_nowplaying_rotate)
		new_now_playing="${now_playing:1}${now_playing:0:1}"
		echo "$new_now_playing" > /tmp/temp_nowplaying_rotate
	else
		now_playing=$(cat /tmp/temp_nowplaying)
		echo "$now_playing " > /tmp/temp_nowplaying_rotate 
	fi
else
	echo $now_playing > /tmp/temp_nowplaying
	if [ "${#now_playing}" -lt 20 ]
	then
			printf -v now_playing "%-19s" "$now_playing"
	fi
	echo "$now_playing " > /tmp/temp_nowplaying_rotate 
fi

printf -v now_playing '%.20s' "$now_playing"
printf -v now_playing "Now Playing : %20s" "$now_playing"

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo "$now_playing | $cpu_usage | $linux_version | $date_formatted "
