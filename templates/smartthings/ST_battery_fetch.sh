#
# SmartThings Google Docs - Battery
#
# Uses packages from ocaml-csv - https://github.com/Chris00/ocaml-csv
#

LOG="/mnt/attic/logs/metrics"

fetch=`wget -qO - https://docs.google.com/spreadsheets/d/<replace>/export?exportFormat=csv | dos2unix | sed '1!{$!d}' |sed -r 's/ battery//g' |sed -r 's/,,/,null,/g' |sed -r 's/,,/,null,/g'|sed -r 's/ /_/g' |sed -r 's/,$/,null/g' > ${LOG}/ST_battery_temp.txt`

for i in {1..40}; do

	device=`csvtool col $i ${LOG}/ST_battery_temp.txt | head -1`
	value=`csvtool col $i ${LOG}/ST_battery_temp.txt | tail -1`

		if [[ ${value} =~ [0-9] ]]; then
		echo ${value} > "${LOG}/ST_battery_${device}.log";
		fi
done
