#
# Sense API Mains
#

watts=`tail -n 1 /mnt/attic/logs/metrics/sense_livefetch.log |jq .payload.w`

echo ${watts}
