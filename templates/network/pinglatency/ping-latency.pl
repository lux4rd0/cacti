#!/usr/bin/perl

# Ping latency script used for "Smoke Ping" graph template within Cacti

$host = $ARGV[0];

# Ping the specified host with 11 ECHO_REQUEST packets, 3 of which don't wait for a reply,
# wait .2 seconds between each packet with a deadline of 2 seconds,
# display numeric output only, quietly, with summary only.

open (PING, "ping -nqc 11 -l 3 -i .2 -w 2 $host|");
while (<PING>)
        {

                # Oh noes, we has packet loss!

                if ($_ =~ /(\d+)% packet loss/)
                {
                        $loss = $1;
                }

                # Catch min avg max mdev, please.

                if ($_ =~ /= (.+)\/(.+)\/(.+)\/(.+?)\s/)
                {
                        ($min,$avg,$max,$dev) = ($1,$2,$3,$4);
                }
        };
close (PING);

# Print the results

print "min:$min avg:$avg max:$max dev:$dev loss:$loss\n";
