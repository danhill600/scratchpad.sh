#!/bin/bash

#I bind this to F9 in my .xbindkeysrcto toggle a little scratch pad in it's own
#region in gnu screen.  It's useful for doing a quick calculation or checking 
#something quickly.
#-dmh 20190529

if [ $(cat ~/.scratchpad_state) == "off" ]
then
	screen -S main -X split 
	screen -S main -X focus down
	screen -S main -X screen -t scratch
	echo "on" > .scratchpad_state
	exit 0 
fi

if [ $(cat ~/.scratchpad_state) == "on" ]
then 
	echo "off" > ~/.scratchpad_state
	screen -S main -X remove
	screen -S main -p scratch -X kill
	exit 0
fi

