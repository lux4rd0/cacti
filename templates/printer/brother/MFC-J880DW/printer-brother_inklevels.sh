#!/bin/bash
#
# Brother MFC-J880DW Ink Levels
# 
# printer-brother_inklevels.sh <hostname>
#
# Provide a printer URL and it returns ink levels, usable as a Cacti script
#
# Dave Schmid, dave@pulpfree.org
# version 0.1
# 2017-10-21
# 

HOSTNAME=$1
DOMAIN="pulpfree.net"
URL="http://${HOSTNAME}.${DOMAIN}/general/status.html"

MAGENTA=`wget -o -q -O - ${URL} |grep -o -E 'Magenta" class="tonerremain" height="[^ ]+' | sed 's/Magenta" class="tonerremain" height="//' |sed 's/"//'`

CYAN=`wget -o -q -O - ${URL} |grep -o -E 'Cyan" class="tonerremain" height="[^ ]+' | sed 's/Cyan" class="tonerremain" height="//' |sed 's/"//'`

YELLOW=`wget -o -q -O - ${URL} |grep -o -E 'Yellow" class="tonerremain" height="[^ ]+' | sed 's/Yellow" class="tonerremain" height="//' |sed 's/"//'`

BLACK=`wget -o -q -O - ${URL} |grep -o -E 'Black" class="tonerremain" height="[^ ]+' | sed 's/Black" class="tonerremain" height="//' |sed 's/"//'`

echo "magenta:${MAGENTA} cyan:${CYAN} yellow:${YELLOW} black:${BLACK}"
