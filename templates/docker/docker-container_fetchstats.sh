# Get Docker Details

DockerHostname=$1
DockerContainerName=$2
DockerID=`cat /mnt/attic/logs/metrics/docker-${DockerHostname}-IDs.txt |grep ${DockerContainerName} |awk {'print $1'}`
#echo "$DockerID"
DockerRandom=`od -A n -t d -N 1 /dev/urandom |tr -d ' '`
StatsFile="/mnt/attic/logs/metrics/docker-${DockerHostname}-${DockerContainerName}_stats.${DockerRandom}.txt"

wget -q -O - http://${DockerHostname}:4243/containers/${DockerID}/stats?stream=false > ${StatsFile}

# CPU

DockerCPUTotal=`cat ${StatsFile} | jq .cpu_stats.cpu_usage.total_usage`

# Memory Total Usage

DockerMemoryTotal=`cat ${StatsFile} | jq .memory_stats.usage`
DockerMemoryActiveAnon=`cat ${StatsFile} | jq .memory_stats.stats.active_anon`
DockerMemoryActiveFile=`cat ${StatsFile} | jq .memory_stats.stats.active_file`
DockerMemoryCache=`cat ${StatsFile} | jq .memory_stats.stats.cache`

# Network

DockerNetworkRX=`cat ${StatsFile} | jq .networks.eth0.rx_bytes`
DockerNetworkTX=`cat ${StatsFile} | jq .networks.eth0.tx_bytes`

printf "DockerCPUTotal:${DockerCPUTotal} DockerMemoryTotal:${DockerMemoryTotal} DockerMemoryActiveAnon:${DockerMemoryActiveAnon} DockerMemoryActiveFile:${DockerMemoryActiveFile} DockerMemoryCache:${DockerMemoryCache} DockerNetworkRX:${DockerNetworkRX} DockerNetworkTX:${DockerNetworkTX}" > /mnt/attic/logs/metrics/docker-${DockerHostname}-${DockerContainerName}_stats.log

rm ${StatsFile}
