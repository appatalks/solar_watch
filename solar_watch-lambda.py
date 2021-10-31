import boto3
import urllib3

# Credits
# https://services.swpc.noaa.gov
# https://towardsdatascience.com/5-minutes-to-create-an-aws-lambda-function-to-stay-updated-about-covid-19-in-your-area-88a4abe77a04
# https://stackoverflow.com/questions/52194888/email-notification-through-sns-and-lambda
# https://www.digitaltrends.com/mobile/how-to-send-a-text-from-your-email-account/

# Define URL - solar_watch.txt generated on Apache Server using solar_watch.sh
url = 'https://example.com/solar_watch.txt'

# Set up http request maker thing
http = urllib3.PoolManager()

# S3 object to store the last call
bucket_name = 'solar-watch'
file_name = 'solar_watch.txt'
object_s3 = boto3.resource('s3') \
                 .Bucket(bucket_name) \
                 .Object(file_name)
                 
# Connect to AWS Simple Notification Service
sns_client = boto3.client('sns')
def lambda_handler(event, context):
    
    # Ping website
    resp = http.request('GET',url)
    new_page = resp.data
    
    # read in old results
    old_page = object_s3.get().get('Body').read()
    
    if new_page == old_page:
        print("Solar Storm Status Clear")
    else:
        print("-- EXTREME SOLAR ALERT DETECTED - TAKE ACTION NOW --")

        sns_client = boto3.client('sns')
        sns_client.publish(
            TopicArn = 'arn:aws:sns:us-east-1:000000000000:solar_watch_sns',
            Subject = 'EXTREME SOLAR ALERT DETECTED - TAKE ACTION NOW',
            Message = 'EXTREME SOLAR ALERT DETECTED - TAKE ACTION NOW - https://www.swpc.noaa.gov/communities/space-weather-enthusiasts'
        )
        
        # Write new data to S3
        object_s3.put(Body = new_page)
        print("Successfully wrote new data to S3")
        
    print("done")
    return None
