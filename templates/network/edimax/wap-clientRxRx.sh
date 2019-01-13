#
# WAP Client Bandwidth by Host
#

HOSTNAME=$1
IPADDRESS=`/usr/bin/resolveip -s ${HOSTNAME}`
MACADDRESS=`/usr/sbin/ip neigh show ${IPADDRESS} |/usr/bin/awk '{print $5}'`

if [ "${MACADDRESS}" = "" ]; then

/usr/bin/echo "wapbasementTx:0 wapbasementRx:0 wapofficeTx:0 wapofficeRx:0 wapgarageTx:0 wapgarageRx:0 wapmbTx:0 wapmbRx:0 waploungeTx:0 waploungeRx:0 waploftTx:0 waploftRx:0"

exit 1

fi

LOG=/mnt/attic/logs/metrics

## WAPBASEMENT

LOGFILE="${LOG}/wapclient-status-wapbasement.txt"

WAPBASEMENTCHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPBASEMENTCHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                wapbasementTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapbasementTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                wapbasementRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapbasementRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   wapbasementTx="0"
   wapbasementRx="0"

fi

## WAPOFFICE

LOGFILE="${LOG}/wapclient-status-wapoffice.txt"

WAPOFFICECHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPOFFICECHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                wapofficeTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapofficeTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                wapofficeRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapofficeRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   wapofficeTx="0"
   wapofficeRx="0"

fi

## WAPGARAGE

LOGFILE="${LOG}/wapclient-status-wapgarage.txt"

WAPGARAGECHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPGARAGECHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                wapgarageTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapgarageTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                wapgarageRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapgarageRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   wapgarageTx="0"
   wapgarageRx="0"

fi

## WAPMB

LOGFILE="${LOG}/wapclient-status-wapmb.txt"

WAPMBCHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPMBCHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                wapmbTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapmbTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                wapmbRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                wapmbRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   wapmbTx="0"
   wapmbRx="0"

fi

## WAPLOUNGE

LOGFILE="${LOG}/wapclient-status-waplounge.txt"

WAPLOUNGECHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPLOUNGECHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                waploungeTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                waploungeTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                waploungeRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                waploungeRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   waploungeTx="0"
   waploungeRx="0"

fi

## WAPLOFT

LOGFILE="${LOG}/wapclient-status-waploft.txt"

WAPLOFTCHECK=`/usr/bin/grep -c -A 3 -i ${MACADDRESS} ${LOGFILE}`

if [ "${WAPLOFTCHECK}" -eq "1" ]; then

        DataRateTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateTx}" = "MBytes" ]; then
                waploftTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateTx}" = "GBytes" ]; then
                tempTx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Tx" | /usr/bin/sed 's/Tx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                waploftTx=`/usr/bin/echo "${tempTx}*1000" | /usr/bin/bc -l`
        fi

        DataRateRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $2}' |/usr/bin/sed 's/\s//g'`

        if [ "${DataRateRx}" = "MBytes" ]; then
                waploftRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
        fi

        if [ "${DataRateRx}" = "GBytes" ]; then
                tempRx=`cat ${LOGFILE} |/usr/bin/grep -A 5 -i "${MACADDRESS}" |/usr/bin/grep "Rx" | /usr/bin/sed 's/Rx//' |/usr/bin/awk '{print $1}' |/usr/bin/sed 's/\s//g'`
                waploftRx=`/usr/bin/echo "${tempRx}*1000" | /usr/bin/bc -l`
        fi

else

   waploftTx="0"
   waploftRx="0"

fi

/usr/bin/echo "wapbasementTx:${wapbasementTx} wapbasementRx:${wapbasementRx} wapofficeTx:${wapofficeTx} wapofficeRx:${wapofficeRx} wapgarageTx:${wapgarageTx} wapgarageRx:${wapgarageRx} wapmbTx:${wapmbTx} wapmbRx:${wapmbRx} waploungeTx:${waploungeTx} waploungeRx:${waploungeRx} waploftTx:${waploftTx} waploftRx:${waploftRx}"
