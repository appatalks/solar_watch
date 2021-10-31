# solar_watch
Alarm if Extreme Solar Storm is Detected | Less Than 1x per cycle (11 Years)
(S.H.T.F. Potential)

This will monitor NOAA's Space Weather and alert if 'Extreme' is flagged.
'Extreme' is a rare event. Carrington-level ~150 Years (Last one was >163 Years ago)
 
https://www.swpc.noaa.gov/communities/space-weather-enthusiasts
https://services.swpc.noaa.gov/products/alerts.json

Dependencies:
cron (cronie); espeak; 

Install Instructions:

1) Install script to $PATH (Example: /usr/local/sbin)
2) Ensure execute bit is enabled: 
   $ chmod +x /path/to/solar_watch.sh
4) Add to crontab 
   $ echo "@reboot /path/to/solar_watch.sh | tee /home/<user>/solar_watch.log" >> /var/spool/cron/<user>

You can verify it is working by viewing the log:
  $ tail -f /home/<user>/solar_watch.log
  
 *** BONUS Points to Impress your Girlfriend ***
 Get a Notification via Amazon SNS:
 1) Create a Lambda Function using solar_watch-lambda.py
 2) Add SNS Topic and EventBridge Trigger
    -- I have mine using carrier's Email to SMS Gateway to keep everything free <myphonenumber>@mycarrier.com
    https://www.digitaltrends.com/mobile/how-to-send-a-text-from-your-email-account/
  
Bitcoin Donation: 16CowvxvLSR4BPEP9KJZiR622UU7hGEce5
Ethereum Donation: 0xf75278bd6e2006e6ef4847c9a9293e509ab815c5
