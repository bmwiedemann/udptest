#!/bin/bash
export port
timeouts=0
for i in $(seq 1 10) ; do
for port in $(seq 40010 40020) ; do 
    echo $i $port
    timeout 0.2 ./testsend.pl
    [ $? != 0 ] && let timeouts++
done 2>&1
done

echo "timeouted $timeouts times"
