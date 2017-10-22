#!/usr/bin/ksh

HOST=$1
TUNER=$2

signal_strength=`wget -q -O - http://${HOST}.pulpfree.net/tuners.html?page=tuner${TUNER} |grep "Signal Strength"|sed 's/<tr>//'|sed 's/<td>//'|sed 's/<td>//'|sed 's/<\/td>/ /'|sed 's/<\/td>//'|sed 's/<\/tr>//'|sed 's/%//'|awk '{print $3}'`

if [ ${signal_strength} = "none" ]
 then
 signal_strength="0"
fi

signal_quality=`wget -q -O - http://${HOST}.pulpfree.net/tuners.html?page=tuner${TUNER} |grep "Signal Quality"|sed 's/<tr>//'|sed 's/<td>//'|sed 's/<td>//'|sed 's/<\/td>/ /'|sed 's/<\/td>//'|sed 's/<\/tr>//'|sed 's/%//'|awk '{print $3}'`

if [ ${signal_quality} = "none" ]
 then
 signal_quality="0"
fi

symbol_quality=`wget -q -O - http://${HOST}.pulpfree.net/tuners.html?page=tuner${TUNER} |grep "Symbol Quality"|sed 's/<tr>//'|sed 's/<td>//'|sed 's/<td>//'|sed 's/<\/td>/ /'|sed 's/<\/td>//'|sed 's/<\/tr>//'|sed 's/%//'|awk '{print $3}'`

if [ ${symbol_quality} = "none" ]
 then
 symbol_quality="0"
fi

streaming_rate=`wget -q -O - http://${HOST}.pulpfree.net/tuners.html?page=tuner${TUNER} |grep "Streaming Rate"|sed 's/<tr>//'|sed 's/<td>//'|sed 's/<td>//'|sed 's/<\/td>/ /'|sed 's/<\/td>//'|sed 's/<\/tr>//'|awk '{print $3}'`

if [ ${streaming_rate} = "none" ]
 then
 streaming_rate="0"
fi

echo "signal_strength:${signal_strength} signal_quality:${signal_quality} symbol_quality:${symbol_quality} streaming_rate:${streaming_rate}"
