#!/bin/bash
img_active="/home/devops/.local/share/icons/Flatery-Indigo-Dark/panel/24@2x/blueman-active.svg"

img_deactive="/home/devops/.local/share/icons/Flatery-Indigo-Dark/panel/24@2x/bluetooth-disabled.svg"

img_conncet="/home/devops/.local/share/icons/Flatery-Indigo-Dark/panel/24@2x/bluetooth-paired.svg"
bluetooth_print() {
    bluetoothctl | while read -r; do
    	if bluetoothctl show | grep -q "Powered: yes"; then
            printf 'BLE: '
            devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
            counter=0

            echo "$devices_paired" | while read -r line; do
                device_info=$(bluetoothctl info "$line")

                if echo "$device_info" | grep -q "Connected: yes"; then
                    device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                    if [ $counter -gt 0 ]; then
						printf "%s" "$device_alias"

						notify-send -i $img_conncet "Bluetooth" "$device_alias connected"
						break
                    else
                        printf "%s" "$device_alias"
						notify-send -i $img_conncet "Bluetooth" "$device_alias connected"
						break;
                    fi

                    counter=$((counter + 1))
				else 
					printf "ON"
					break
                fi
            done

            printf '\n'
        else
            echo "BLE: OFF"
        fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
