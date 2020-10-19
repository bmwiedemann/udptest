#!/bin/sh
timeouts=0
x=$((11 + (RANDOM % 600)))
echo "x=$x"
export port
for port in $(seq ${x}00 ${x}39) ; do
  timeout 0.8 ./testhttp.pl > /dev/null
  [ $? != 0 ] && let timeouts++
done

echo "timeouted $timeouts times"
