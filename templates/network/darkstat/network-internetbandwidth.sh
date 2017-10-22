#
# Internet Bandwidth by IP
#

HOSTNAME=$1

IPADDRESS=`nslookup ${HOSTNAME} | awk '/^Address: / { print $2 }'`

rx=`wget --quiet -O - "http://10.10.0.1:666/hosts/?full=yes" |grep -A 3 -i "${IPADDRESS}/" |tail -n 1 |tail -n 1 |sed 's/ <td class="num">//'|sed 's/<\/td>//' |sed 's/,//g'`

tx=`wget --quiet -O - "http://10.10.0.1:666/hosts/?full=yes" |grep -A 4 -i "${IPADDRESS}/" |tail -n 1 |tail -n 1 |sed 's/ <td class="num">//'|sed 's/<\/td>//' |sed 's/,//g'`

echo "rx:${rx} tx:${tx}"
