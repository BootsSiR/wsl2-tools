#!/bin/sh
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
 sudo  /etc/init.d/docker start
fi
