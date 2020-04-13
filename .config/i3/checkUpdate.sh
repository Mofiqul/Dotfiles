#!/bin/bash

i3status | while :
do
    read line
    #updateCount=`apt list --upgradable |wc -l`
	#if [$updateCount == 1]; then
		#updateCount=0
	#fi
	echo " $(free -h | awk '/^Mem/ {print $3}' )|$line "
done
