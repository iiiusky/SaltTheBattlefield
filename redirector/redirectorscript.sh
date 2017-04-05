#!/bin/sh
screen -m -d -S "socat80" bash -c "socat TCP4-LISTEN:80,fork TCP4:cs4.ravenbin.com:80"
screen -m -d -S "socat443" bash -c "socat TCP4-LISTEN:443,fork TCP4:cs4.ravenbin.com:443"
