#
# Sense API Device Wattage Snapshot
#

sense_random=`od -A n -t d -N 1 /dev/urandom |tr -d ' '`

#token=`curl -k --data "email=name@hostname.com" --data "password=RANDOM" -H "Sense-Client-Version: 1.18.1-${sense_random}" -H "X-Sense-Protocol: 3" -H "User-Agent: okhttp/3.8.0" "https://api.sense.com/apiservice/api/v1/authenticate" |jq .access_token |sed -e 's|[""]||g'`

token=`cat /mnt/attic/scripts/metrics/tokens/sense`

monitor="26056"
device=$1

curl -k -H "Authorization: bearer ${token}" -H "Sense-Client-Version: 1.17.1-${sense_random}" -H "X-Sense-Protocol: 3" -H "User-Agent: okhttp/3.8.0" "https://api.sense.com/apiservice/api/v1/app/history/usage?monitor_id=${monitor}&granularity=MINUTE&start=`date --iso-8601=seconds -d \"15 mins ago\"`&frames=1&device_id=${device}" |jq .totals[][] |head -1
