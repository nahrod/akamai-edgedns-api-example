#!/bin/sh

ZONE="apidemo.aka.johanaldor.se"

while inotifywait -q -e close_write $ZONE
do 
    cat $ZONE | http --auth-type edgegrid POST :"/config-dns/v2/zones/$ZONE/zone-file" "Content-Type: text/dns"
done



