#
# Sense API Device Details
#

sense_random=`od -A n -t d -N 1 /dev/urandom |tr -d ' '`

#token=`curl -k --data "email=name@hostname.com" --data "password=random" -H "Sense-Client-Version: 1.18.1-${sense_random}" -H "X-Sense-Protocol: 3" -H "User-Agent: okhttp/3.8.0" "https://api.sense.com/apiservice/api/v1/authenticate" |jq .access_token |sed -e 's|[""]||g'`

token=`cat /mnt/attic/scripts/metrics/tokens/sense`

monitor="ID"

device=$1

curl -k -H "Authorization: bearer ${token}" -H "Sense-Client-Version: 1.18.1-${sense_random}" -H "X-Sense-Protocol: 3" -H "User-Agent: okhttp/3.8.0" "https://api.sense.com/apiservice/api/v1/app/monitors/${monitor}/devices/${device}" > /tmp/sense_${device}_details.tmp

avg_monthly_runs=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_monthly_runs`
avg_monthly_pct=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_monthly_pct`
avg_duration=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_duration`
current_month_runs=`cat /tmp/sense_${device}_details.tmp | jq .usage.current_month_runs`
yearly_KWH=`cat /tmp/sense_${device}_details.tmp | jq .usage.yearly_KWH`
yearly_cost=`cat /tmp/sense_${device}_details.tmp | jq .usage.yearly_cost`
current_month_cost=`cat /tmp/sense_${device}_details.tmp | jq .usage.current_month_cost`
avg_monthly_cost=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_monthly_cost`
avg_watts=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_watts`
avg_monthly_KWH=`cat /tmp/sense_${device}_details.tmp | jq .usage.avg_monthly_KWH`
current_month_KWH=`cat /tmp/sense_${device}_details.tmp | jq .usage.current_month_KWH`

echo "avg_monthly_runs:${avg_monthly_runs} avg_monthly_pct:${avg_monthly_pct} avg_duration:${avg_duration} current_month_runs:${current_month_runs} yearly_KWH:${yearly_KWH} yearly_cost:${yearly_cost} current_month_cost:${current_month_cost} avg_monthly_cost:${avg_monthly_cost} avg_watts:${avg_watts} avg_monthly_KWH:${avg_monthly_KWH} current_month_KWH:${current_month_KWH}"
