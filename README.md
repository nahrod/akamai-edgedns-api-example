# Updating a Akamai EdgeDNS zone with the API

This is a very small bash script explaining, in it's very simplest form (=would not recommend for production), how you can automatically update Akamai EdgeDNS byt monitoring writes to a zone file on disk.

If you already have a zone on EdgeDNS you can download the zonefile with the following command;
```
http --auth-type edgegrid :"/config-dns/v2/zones/apidemo.aka.johanaldor.se/zone-file" "Accept: text/dns"
```

## Usage Instructions

Install "inotify-tools" package to get ```inotifywait```

Make the script executable: ```chmod +x watch-and-update-zone.sh```

Run the script: ```./watch-and-update-zone.sh```

Edit the zonefile and save it with your changes, don't forget to update the SERIAL in the SOA record.