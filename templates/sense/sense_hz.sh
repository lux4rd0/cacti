#
# Sense API Mains
#
hz=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.hz`

echo ${hz}
