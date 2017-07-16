#!/bin/sh

while true
do
        echo 1 > /sys/class/gpio/gpio101/value    # turn on
        sleep 1
        echo 0 > /sys/class/gpio/gpio101/value   # turn off
        sleep 1
done

