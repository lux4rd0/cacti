#!/bin/bash
#
# Docker CPU and Memory Stats for SNMP
#
# docker-cpu_memory.sh <container>
#
# Provide the name of your container and it returns CPU and Memory usage, usable as a Cacti script
#
# Dave Schmid, dave@pulpfree.org
# version 0.1
# 2018-03-02
#

WGETTMP=`wget -q -O - http://boulphstation.pulpfree.net:2375/containers/${1}/stats?stream=0`

echo ${WGETTMP} | jq '.cpu_stats.cpu_usage.usage_in_usermode' | sed 's/.\{7\}$//'
echo ${WGETTMP} | jq '.cpu_stats.cpu_usage.usage_in_kernelmode' | sed 's/.\{7\}$//'
echo ${WGETTMP} | jq '.cpu_stats.system_cpu_usage' | sed 's/.\{7\}$//'
echo ${WGETTMP} | jq '.memory_stats.usage'
