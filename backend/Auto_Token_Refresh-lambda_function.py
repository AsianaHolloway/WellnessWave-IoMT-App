import json
import requests
import sys
from datetime import datetime, timedelta
import boto3
import base64

def get_fitbit_auth():
    myclient = boto3.client('dynamodb') 
    GetItem = myclient.get_item(
        TableName='fitbitToken',
        Key={
            'user_id': {
                'S': 'BN4WML'
            },
        }
    )
    return GetItem['Item']

def lambda_handler(event, context):
    fitbit_auth = get_fitbit_auth()

    access_token = fitbit_auth['access_token']['S']
    refresh_token = fitbit_auth['refresh_token']['S']
    time_stamp = fitbit_auth['time_stamp']['S']
    expires_in = fitbit_auth['expires_in']['S']

    # Fitbit credentials
    client_id = "23PXJ6"
    client_secret = "9e177597e0477a30e0da77ff210a33a4"

    # Base64 encode client_id:client_secret
    basic_auth = base64.b64encode(f"{client_id}:{client_secret}".encode()).decode()

    url = "https://api.fitbit.com/oauth2/token"
    headers = {
        "Authorization": f"Basic {basic_auth}",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    data = {
        "grant_type": "refresh_token",
        "refresh_token": refresh_token,
        "client_id": client_id
    }

    response = requests.post(url, headers=headers, data=data)

    if response.status_code == 200:
        ret_auth = response.json()
        mydb = boto3.resource('dynamodb')
        mytable = mydb.Table('fitbitToken')

        now = datetime.now()
        formatted_date_time = now.strftime("%Y-%m-%d %H:%M:%S")

        item = {
            'access_token': ret_auth['access_token'],
            'refresh_token': ret_auth['refresh_token'],
            'user_id': 'BN4WML',
            'expires_in': str(ret_auth['expires_in']),
            'token_type': ret_auth['token_type'],
            'time_stamp': formatted_date_time
        }

        mytable.put_item(Item=item)

        json_return = {
            'statusCode': 200,
            'body': f"Successfully refreshed access token for user id: BN4WML."
        }
        print(json_return)
        return json_return
    else:
        json_return = {
            'statusCode': response.status_code,
            'body': 'Could not complete request for access token.'
        }
        print(json_return)
        return json_return
