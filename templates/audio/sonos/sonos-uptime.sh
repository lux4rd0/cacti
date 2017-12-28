#!/bin/bash
#
# Sonos - Uptime in Seconds
#
# sonos-uptime.sh <hostname>
#
# Provide a Sonos speaker URL and it returns the number of seconds of uptime, usable as a Cacti script
#
# Dave Schmid, dave@pulpfree.org
# version 0.1
# 2017-12-28
#

HOSTNAME=$1
DOMAIN="pulpfree.net"
URL="http://${HOSTNAME}.${DOMAIN}:1400/status/zp"

wget -qO- ${URL} |grep UptimeSeconds |grep -Eo '[0-9]{1,7}' |tail -1
