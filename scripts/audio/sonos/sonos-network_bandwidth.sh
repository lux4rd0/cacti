#!/bin/bash
#
# Sonos - Network Bandwidth Usage
#
# sonos-network_bandwidth.sh <hostname>
#
# Provide a Sonos speaker URL and Network Interface and it returns RX and TX metrics, usable as a Cacti script
#
# Dave Schmid, dave@pulpfree.org
# version 0.1
# 2017-10-21
#

HOSTNAME=$1
INTERFACE=$2
DOMAIN="pulpfree.net"
URL="http://${HOSTNAME}.${DOMAIN}:1400/status/ifconfig"

wget -qO- ${URL} | grep -A 6 ${INTERFACE} | grep "RX bytes:" | awk '{print $2,$6;}' | sed -n 1p | sed 's/bytes/rxBytes/' | sed 's/bytes/txBytes/'
