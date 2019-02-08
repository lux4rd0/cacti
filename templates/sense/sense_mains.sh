#
# Sense API Mains
#
mainsL=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.channels[] -c | head -1`
mainsR=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.channels[] -c | tail -1`

echo "mainsL:${mainsL} mainsR:${mainsR}"
