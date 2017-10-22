#
# WAP Client Info by Host
#

HOSTNAME=$1

MACADDRESS=`/usr/sbin/arp -a ${HOSTNAME} | sed -n -e 's/^.*at //p' |cut -c1-17`

LOG=/mnt/attic/logs/metrics

## WAPBASEMENT

LOGFILE="${LOG}/wapclient-status-wapbasement.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPBASEMENT=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPBASEMENT="null"

fi 


## WAPOFFICE

LOGFILE="${LOG}/wapclient-status-wapoffice.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPOFFICE=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPOFFICE="null"

fi



## WAPGARAGE

LOGFILE="${LOG}/wapclient-status-wapgarage.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPGARAGE=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPGARAGE="null"

fi


## WAPMB

LOGFILE="${LOG}/wapclient-status-wapmb.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPMB=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPMB="null"

fi


## WAPLOUNGE

LOGFILE="${LOG}/wapclient-status-waplounge.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPLOUNGE=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPLOUNGE="null"

fi



## WAPLOFT

LOGFILE="${LOG}/wapclient-status-waploft.txt"

CHECK=`grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${CHECK}" -eq "1" ]; then

   WAPLOFT=`cat ${LOGFILE} |grep -A 3 -i "${MACADDRESS}" |grep "Signal (%)" | sed 's/Signal (%)//' |sed 's/\s//g'`

else

   WAPLOFT="null"

fi

echo "wapbasement:${WAPBASEMENT} wapoffice:${WAPOFFICE} wapgarage:${WAPGARAGE} wapmb:${WAPMB} waplounge:${WAPLOUNGE} waploft:${WAPLOFT}"
