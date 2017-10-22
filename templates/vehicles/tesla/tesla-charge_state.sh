#
# TESLA Charge State
#

log_file="/mnt/attic/logs/metrics/tesla_metrics.txt"

battery_level=`cat ${log_file} |grep -o -E ' battery_level:[^ ]+' | sed 's/ battery_level://'`
battery_range=`cat ${log_file} |grep -o -E ' battery_range:[^ ]+' | sed 's/ battery_range://'`
charge_current_request=`cat ${log_file} |grep -o -E ' charge_current_request:[^ ]+' | sed 's/ charge_current_request://'`
charge_current_request_max=`cat ${log_file} |grep -o -E ' charge_current_request_max:[^ ]+' | sed 's/ charge_current_request_max://'`
charge_energy_added=`cat ${log_file} |grep -o -E ' charge_energy_added:[^ ]+' | sed 's/ charge_energy_added://'`
charge_limit_soc_max=`cat ${log_file} |grep -o -E ' charge_limit_soc_max:[^ ]+' | sed 's/ charge_limit_soc_max://'`
charge_limit_soc_min=`cat ${log_file} |grep -o -E ' charge_limit_soc_min:[^ ]+' | sed 's/ charge_limit_soc_min://'`
charge_limit_soc_std=`cat ${log_file} |grep -o -E ' charge_limit_soc_std:[^ ]+' | sed 's/ charge_limit_soc_std://'`
charge_limit_soc=`cat ${log_file} |grep -o -E ' charge_limit_soc:[^ ]+' | sed 's/ charge_limit_soc://'`
charge_miles_added_ideal=`cat ${log_file} |grep -o -E ' charge_miles_added_ideal:[^ ]+' | sed 's/ charge_miles_added_ideal://'`
charge_miles_added_rated=`cat ${log_file} |grep -o -E ' charge_miles_added_rated:[^ ]+' | sed 's/ charge_miles_added_rated://'`
charge_rate=`cat ${log_file} |grep -o -E ' charge_rate:[^ ]+' | sed 's/ charge_rate://'`
charger_actual_current=`cat ${log_file} |grep -o -E ' charger_actual_current:[^ ]+' | sed 's/ charger_actual_current://'`
charger_pilot_current=`cat ${log_file} |grep -o -E ' charger_pilot_current:[^ ]+' | sed 's/ charger_pilot_current://'`
charger_power=`cat ${log_file} |grep -o -E ' charger_power:[^ ]+' | sed 's/ charger_power://'`
charger_voltage=`cat ${log_file} |grep -o -E ' charger_voltage:[^ ]+' | sed 's/ charger_voltage://'`
est_battery_range=`cat ${log_file} |grep -o -E ' est_battery_range:[^ ]+' | sed 's/ est_battery_range://'`
ideal_battery_range=`cat ${log_file} |grep -o -E ' ideal_battery_range:[^ ]+' | sed 's/ ideal_battery_range://'`
max_range_charge_counter=`cat ${log_file} |grep -o -E ' max_range_charge_counter:[^ ]+' | sed 's/ max_range_charge_counter://'`
time_to_full_charge=`cat ${log_file} |grep -o -E ' time_to_full_charge:[^ ]+' | sed 's/ time_to_full_charge://'`
usable_battery_level=`cat ${log_file} |grep -o -E ' usable_battery_level:[^ ]+' | sed 's/ usable_battery_level://'`

echo "battery_level:${battery_level} battery_range:${battery_range} charge_current_request:${charge_current_request} charge_current_request_max:${charge_current_request_max} charge_energy_added:${charge_energy_added} charge_limit_soc_max:${charge_limit_soc_max} charge_limit_soc_min:${charge_limit_soc_min} charge_limit_soc_std:${charge_limit_soc_std} charge_limit_soc:${charge_limit_soc} charge_miles_added_ideal:${charge_miles_added_ideal} charge_miles_added_rated:${charge_miles_added_rated} charge_rate:${charge_rate} charger_actual_current:${charger_actual_current} charger_pilot_current:${charger_pilot_current} charger_power:${charger_power} charger_voltage:${charger_voltage} est_battery_range:${est_battery_range} ideal_battery_range:${ideal_battery_range} max_range_charge_counter:${max_range_charge_counter} time_to_full_charge:${time_to_full_charge} usable_battery_level:${usable_battery_level}"
