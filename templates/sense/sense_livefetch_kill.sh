sleep 5
ps aux | grep 'websocat' | awk '{print $2}' | xargs kill
mv /mnt/attic/logs/metrics/sense_livefetch.log.tmp /mnt/attic/logs/metrics/sense_livefetch.log
