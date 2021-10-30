#!/bin/bash

# solar_watch.sh - Monitors a web page for changes
# eSpeak alert if Extreme is found
# Usage: ./solar_watch.sh https://hoshisato.com

# DOMAIN=$1

while true; do
if curl -s https://services.swpc.noaa.gov/products/alerts.json | grep -i 'extreme' > /dev/null
 then
        for i in {1..3}; do
          espeak -z -k20 -v +f4 -p 70 -s 200 "Alert... Alert... Alert.... S.. H.. T.. F.. Extreme Solar Storm and Radiation Detected.... Take Action Now... Alert... Alert... Alert... S.. H.. T.. F.. Extreme Solar Storm and Radiation Detected... Take Action Now..." 2>/dev/null 
        echo "!!! Alert Alert Alert. Extreme Solar Radiation. S.H.T.F Solar Storm Detected. !!!"
        echo "Visit https://www.swpc.noaa.gov/communities/space-weather-enthusiasts# Immediately"
        done
 else
        echo "Status: Extreme Solar Radiation Watch Clear"
        date
        sleep 350
        clear
fi
done
