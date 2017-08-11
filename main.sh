#!/bin/bash

path="/home/noah/Projects/shell/autoclick"
state=$( cat ${path}/state )
script="autoclick.sh"
key="$1"
delay="$2"
if [ -z "$1" ]; then
	key="click 1"
fi
if [ -z "$2" ]; then
	delay="1000"
fi

if [ "$state" -eq "0" ]; then  # activate auto-clicking
	echo -n "1" > ${path}/state
	${path}/"${script}" "$key" "$delay" &
elif [ "$state" -eq "1" ]; then  # stop auto-clicking
	echo -n "0" > ${path}/state
	pkill "${script}"
else
	echo -n "0" > ${path}/state
fi

