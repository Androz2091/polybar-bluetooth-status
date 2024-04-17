#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "disabled"
else
  battery=$(bluetoothctl info | grep "Battery Percentage" | awk '{print $4}' | tr -d '()')
  device_name=$(bluetoothctl info | grep "Alias" | awk -F ': ' '{print $2}')

  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then
    echo "enabled"
  else
    if [ -n "$battery" ]
    then
      echo "$device_name ($battery%)"
    else
      echo "connected"
    fi
  fi
fi
