#!/bin/bash
#

# exit when any command fails
# set -e

# Set now Variable
# now=`date +"%Y-%m-%d"`

# Read Account IDs from File
# for i in  $(cat encore_account_ids.txt); do lookup=$i; 

# Start CSV
# for f in ./output/Encore*csv
# do
#    if [[ ! -e "$f" ]]
#    then
#	mkdir -p ./output/
#	echo "Account Number","Account Name","Account Manager","Account BDC","Lead Engineer" > ./output/Encore_Account-Discovery${now}.csv
#    fi
#done

# Import All
#account=`python3 encore_account.py $lookup`
#accountname=`echo $account |jq '.name'`
#accountid=`echo $account | jq '.id'`
#accountmgr=`echo $account | jq '.roles[] | select (.role.name=="Account Manager") | .user.name'`
#leadtech=`echo $account | jq '.roles[] | select (.role.name=="Primary Lead Tech") | .user.name'`
#bdc=`echo $account | jq '.roles[] | select (.role.name=="Business Development Consultant") | .user.name'`
#
## Output to CSV 
#echo $accountid,$accountname,$accountmgr,$leadtech,$bdc >> ./output/Encore_Account-Discovery${now}.csv
#
## Clean Up
#
## Complete
#done
#echo "Discovery Completed!"

product_id=`curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].product_id`
issue_datetime=curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].issue_datetime
scale=curl -s https://services.swpc.noaa.gov/products/alerts.json | jq -r .[].message | grep "NOAA Scale"
