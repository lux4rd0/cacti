#
# Sense API Voltages
#

voltageL=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.voltage[] -c | head -1`
voltageR=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.voltage[] -c | tail -1`

echo "voltageL:${voltageL} voltageR:${voltageR}"
