#
# WAP Client Info - RSSI by Host
#

HOSTNAME=$1
IPADDRESS=`/usr/bin/resolveip -s ${HOSTNAME}`
SILENTPING=`/usr/sbin/fping -c1 -t100 ${HOSTNAME} > /dev/null 2>&1`
MACADDRESS=`/usr/sbin/ip neigh show ${IPADDRESS} |awk '{print $5}'`

if [ "${MACADDRESS}" = "" ]; then

echo "wapbasement:0 wapoffice:0 wapgarage:0 wapmb:0 waplounge:0 waploft:0"

exit 1

fi


LOG=/mnt/attic/logs/metrics

## WAPBASEMENT

LOGFILE="${LOG}/wapclient-status-wapbasement.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPBASEMENT=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPBASEMENT="0"

fi 


## WAPOFFICE

LOGFILE="${LOG}/wapclient-status-wapoffice.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPOFFICE=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPOFFICE="0"

fi


## WAPGARAGE

LOGFILE="${LOG}/wapclient-status-wapgarage.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPGARAGE=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPGARAGE="0"

fi


## WAPMB

LOGFILE="${LOG}/wapclient-status-wapmb.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPMB=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPMB="0"

fi


## WAPLOUNGE

LOGFILE="${LOG}/wapclient-status-waplounge.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPLOUNGE=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPLOUNGE="0"

fi


## WAPLOFT

LOGFILE="${LOG}/wapclient-status-waploft.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPLOFT=`cat ${LOGFILE} |grep -A 4 -i "${MACADDRESS}" |grep "RSSI (dBm)" | sed 's/RSSI (dBm)//' |sed 's/\s//g'`

else

   WAPLOFT="0"

fi

echo "wapbasement:${WAPBASEMENT} wapoffice:${WAPOFFICE} wapgarage:${WAPGARAGE} wapmb:${WAPMB} waplounge:${WAPLOUNGE} waploft:${WAPLOFT}"
