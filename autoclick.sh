#!/bin/bash

key="$1"
delay="$2"

while [ true ]; do
	xdotool key $key
	sleep $( echo "$delay / 1000" | bc -l )
done

