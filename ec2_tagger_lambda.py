import boto3

AWS_REGION = "us-east-1"

ec2 = boto3.client('ec2',region_name=AWS_REGION)

def lambda_handler(event, context):
    instance_id = event['detail']['responseElements']['instancesSet']['items'][0]['instanceId']
    tag_key = "PerconaCreatedBy"
    # principalId = str(event['detail']['userIdentity']['principalId'].split(':')[1])
    # aws_cli_user = str(event['detail']['userIdentity']['arn'].split('/')[1])
    if str(event['detail']['userIdentity']['type']) == "AssumedRole":
        principalId = str(event['detail']['userIdentity']['principalId'].split(':')[1])
    elif str(event['detail']['userIdentity']['type']) == "IAMUser":
        principalId = str(event['detail']['userIdentity']['arn'].split('/')[1])
        #principalId = principalId.split('-')[0] + '@percona.com'
        
    ec2.create_tags(Resources=[instance_id], Tags=[{'Key': tag_key, 'Value': principalId}])