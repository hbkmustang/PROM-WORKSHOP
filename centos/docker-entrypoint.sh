#!/bin/bash

# xinetd -dontfork -stayalive

xinetd

while true
do
 stress --cpu 2 --io 2 --vm 2 --vm-bytes 128M --timeout 20s
 sleep 120
done
