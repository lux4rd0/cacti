ioreg -n BNBMouseDevice | grep -i '"BatteryPercent" ='|sed 's/[^[:digit:]]//g'
