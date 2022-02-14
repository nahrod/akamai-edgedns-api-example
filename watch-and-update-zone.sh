#!/bin/sh

# Get your zonefile template: http --auth-type edgegrid :"/config-dns/v2/zones/apidemo.aka.johanaldor.se/zone-file" "Accept: text/dns"

# Don't forget to tick the SOA serial up one/change date
# Update zonefile: cat apidemo.aka.johanaldor.se | http --auth-type edgegrid POST :"/config-dns/v2/zones/apidemo.aka.johanaldor.se/zone-file" "Content-Type: text/dns"
# while inotifywait -q -e close_write apidemo.aka.johanaldor.se; do cat apidemo.aka.johanaldor.se; done

ZONE="apidemo.aka.johanaldor.se"

while inotifywait -q -e close_write $ZONE
do 
    cat $ZONE | http --auth-type edgegrid POST :"/config-dns/v2/zones/$ZONE/zone-file" "Content-Type: text/dns"
done



