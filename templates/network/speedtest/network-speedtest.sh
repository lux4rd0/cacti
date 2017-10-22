#
# Network Speedtest
#

speedtest-cli --simple |cut -d" " -f1,2 |sed -e 's/ //g'|tr '\n' ' ' > /mnt/attic/logs/metrics/network-speedtest.log.tmp
mv /mnt/attic/logs/metrics/network-speedtest.log.tmp /mnt/attic/logs/metrics/network-speedtest.log
