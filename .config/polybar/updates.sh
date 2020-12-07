 #!/bin/bash
if ! updates=$(apt list --upgradable 2> /dev/null| awk '{print $1}' | wc -l); then
	updates=0
fi

if [ "$updates" -gt 1 ]; then
	echo "%{F#ff5555}  : $(($updates - 1)) %{F-}"
else
	echo ""
fi
