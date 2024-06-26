#!/bin/bash

function adjust_opacity() {
	amixer -q set Master $1
	
	VOLUME=$(amixer get Master | grep -o '\[[0-9]*%\]' | grep -o '[0-9]*' | sed -n '2p')

	if amixer get Master | grep -q "\[on\]"
	then
		MUTED=""
	else
		MUTED=" (mute)"
	fi	

	notify-send -u "critical" -t 750 -h int:value:$VOLUME "Volume : $VOLUME%$MUTED"

}

while getopts ":mtv:" opt; do
	    case $opt in
	m)
		mute
		;;
	t)
		toggle_sink
		;;
	v)
		adjust_volume "$OPTARG"
		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		;;
	esac
done
