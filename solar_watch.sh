#!/bin/bash

# solar_watch.sh - Monitors a web page for changes

while true; do

# Import All
product_id=`curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].product_id|head -n1`
issue_datetime=`curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].issue_datetime|head -n1`
scale=`curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].message |head -n15| grep "NOAA Scale"|head -n1`
# Output to CSV for record keeping
echo $issue_datetime,$cale >> Solar_watch_results.csv

# Just grab the last 2-3 days of JSON Output.
if curl -s https://services.swpc.noaa.gov/products/alerts.json | jq | head -n 25 | grep -i 'extreme' > /dev/null
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
