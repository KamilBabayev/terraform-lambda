import boto3
from botocore.exceptions import ClientError

 
AWS_REGION = "us-east-1"
rds = boto3.client('rds',region_name=AWS_REGION)
 
def lambda_handler(event, context):
    if event['detail']['eventName'] == "CreateDBInstance":
        instance_id = event['detail']['responseElements']['dBInstanceArn']
        tag_key = "PerconaCreatedBy"
        if str(event['detail']['userIdentity']['type']) == "AssumedRole":
            principalId = str(event['detail']['userIdentity']['principalId'].split(':')[1])
        elif str(event['detail']['userIdentity']['type']) == "IAMUser":
            principalId = str(event['detail']['userIdentity']['arn'].split('/')[1])
            #principalId = principalId.split('-')[0] + '@percona.com'
             #print(principalId, instance_id)
        elif str(event['detail']['userIdentity']['type']) == "Root":
            principalId = 'CreatedByRootUserFromWebInterface'
        try:
            rds.add_tags_to_resource(ResourceName=instance_id, Tags=[{'Key': tag_key, 'Value': principalId}])
        except ClientError as e:
            if e.response['Error']['Code'] == 'DBClusterNotFoundFault':
                print("Error: DBClusterNotFoundFault")
            else:
                print("Unexpected error: %s" % e)    
