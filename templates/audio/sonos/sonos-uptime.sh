#!/bin/bash
#
# Sonos - Uptime in Seconds
#
# sonos-uptime.sh <hostname>
#
# Provide a Sonos speaker URL and it returns the number of seconds of uptime, usable as a Cacti script
#
# Requires html2text Python library - https://pypi.python.org/pypi/html2text
#
# Dave Schmid, dave@pulpfree.org
# version 0.1
# 2017-12-28
#

HOSTNAME=$1
DOMAIN="pulpfree.net"
URL="http://${HOSTNAME}.${DOMAIN}:1400/status/uptime"

days=`html2text --escape-all ${URL} | head -1 | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/' | grep -Po "[[:digit:]]+ *(?=day)"`

hours=`html2text --escape-all ${URL} | head -1 | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/' | grep -Po "[[:digit:]]+ *(?=hour)"`

minutes=`html2text --escape-all ${URL} | head -1 | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/([[:digit:]]+):0?([[:digit:]]+)/\1 hours, \2 minutes/' | grep -Po "[[:digit:]]+ *(?=minute)"`

uptimesecs=$(($minutes*60))
uptimesecs=$(($hours*3600+$uptimesecs))


if [[ ${days} =~ [0-9] ]]; then
    uptimesecs=$(($days*86400+$uptimesecs))
fi

echo "${uptimesecs}"
