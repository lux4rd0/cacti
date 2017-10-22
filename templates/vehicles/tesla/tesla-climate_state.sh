#
# TESLA Climate State
#


log_file="/mnt/attic/logs/metrics/tesla_metrics.txt"

driver_temp_setting=`cat ${log_file} |grep -o -E ' driver_temp_setting:[^ ]+' | sed 's/ driver_temp_setting://'`
inside_temp=`cat ${log_file} |grep -o -E ' inside_temp:[^ ]+' | sed 's/ inside_temp://'`
outside_temp=`cat ${log_file} |grep -o -E ' outside_temp:[^ ]+' | sed 's/ outside_temp://'`
passenger_temp_setting=`cat ${log_file} |grep -o -E ' passenger_temp_setting:[^ ]+' | sed 's/ passenger_temp_setting://'`

echo "driver_temp_setting:${driver_temp_setting} inside_temp:${inside_temp} outside_temp:${outside_temp} passenger_temp_setting:${passenger_temp_setting}"
