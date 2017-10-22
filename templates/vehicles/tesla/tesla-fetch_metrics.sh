teslacmd -u $1 -p $2 -cdtv > /mnt/attic/logs/metrics/tesla_metrics.txt.tmp

cat /mnt/attic/logs/metrics/tesla_metrics.txt.tmp | sed 's/,/ /g' | tr -d '"' | tr -d '{' | tr -d '}' | tr '\n' ' ' |sed 's/: /:/g' |sed 's/    / /g' | tr -s ' ' | sed 's/'\''//g' | cut -c 2- > /mnt/attic/logs/metrics/tesla_metrics.txt
