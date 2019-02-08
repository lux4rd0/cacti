#
# Sense Current Wattage by Device
#

device=$1

tail -1 /mnt/attic/logs/metrics/sense_livefetch.log  |jq '.payload.devices[0,1,2,3,4,5,6,7,8,9] | {name, w}' -c |sed -e 's/ /_/g' |sed -e 's/{\"name\":"//g' |sed -e 's/\",\"w\"//g' |sed -e 's/}//g' |grep "${device}" | awk -F':' '{print $2}' |sed "s/\..*//"
