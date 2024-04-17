#!/bin/sh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  bluetoothctl power on
  sleep 3
  
  bluetoothctl devices | while read -r line
  do
    device=$(echo "$line" | awk '{print $2}')
    bluetoothctl connect "$device"
  done
else
  bluetoothctl power off
fi
