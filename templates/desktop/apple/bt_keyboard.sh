ioreg -n AppleBluetoothHIDKeyboard | grep -i '"BatteryPercent" ='|sed 's/[^[:digit:]]//g'
