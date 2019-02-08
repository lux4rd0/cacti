#
# TESLA Drive State
#

log_file="/mnt/attic/logs/metrics/tesla_metrics.txt"

odometer=`cat ${log_file} |grep -o -E ' odometer:[^ ]+' | sed 's/ odometer://'`
speed=`cat ${log_file} |grep -o -E ' speed:[^ ]+' | sed 's/ speed://'`

echo "odometer:${odometer//.*/} speed:${speed}"
