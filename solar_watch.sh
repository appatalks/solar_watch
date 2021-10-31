#!/bin/bash

# solar_watch.sh - Monitors a web page for changes

while true; do
# if curl -s https://services.swpc.noaa.gov/products/alerts.json | egrep -i 'extreme|severe' > /dev/null
if curl -s https://services.swpc.noaa.gov/products/alerts.json | grep -i 'extreme' > /dev/null
 then
        echo "Alert * Alert * Alert * Extreme Solar Storm and Radiation Detected * Take Action Now" > /var/www/vhosts/mywebsite/public_html/solar_watch.txt
 else
        echo "Status: Extreme Solar Radiation Watch Clear" > /var/www/vhosts/mywebsite/public_html/solar_watch.txt
        date
        echo "Status: Extreme Solar Radiation Watch Clear" 
        sleep 350
        clear
fi
done
