#
# Sonos Beacon Drops and PRR
#

SERVER=$1

set $(wget -qO- http://$SERVER.pulpfree.net:1400/status/proc/ath_rincon/station |tail -3 | head -n 1)

echo "beacon:${5} drop:${14} prr:${13//%/}"
