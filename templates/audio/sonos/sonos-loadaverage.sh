#!/bin/sh

#
# Load Average Sonos
#

SERVER=$1

set $(wget -qO- http://$SERVER.pulpfree.net:1400/status/uptime | sed 's/.*load average: //g' | sed 's/,//g')

min01=$4
min05=$5
min15=$6

echo "min01:${min01} min05:${min05} min15:${min15}"
