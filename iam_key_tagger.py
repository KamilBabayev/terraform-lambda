import boto3
from botocore.exceptions import ClientError

AWS_REGION = "us-east-1"
client = boto3.client('iam')

def lambda_handler(event, context):
    #client.tag_user(UserName='kamil-babayev-temp-user', Tags=[{'Key': 'name113', 'Value': 'Kamilkey334'}])
    #client.tag_user(UserName='db_iam_user', Tags=[{'Key': 'name113', 'Value': 'Kamilkey334'}])
    # iam_key_name = str(event['detail']['requestParameters']['userName'])
    # if event['detail']['userIdentity']['type'] == 'IAMUser':
    #     client.tag_user(UserName=iam_key_name, Tags=[{'Key': 'PerconaCreatedBy', 'Value': iam_key_name}])
    # iam_user_principal_id = str(event['detail']['userIdentity']['principalId'].split(':')[1])
    # client.tag_user(UserName=iam_key_name, Tags=[{'Key': 'PerconaCreatedBy', 'Value': iam_user_principal_id}])

    if event['detail']['userIdentity']['type'] == 'IAMUser':
        iam_key_name = str(event['detail']['requestParameters']['userName'])
        cli_user_used_to_create_iam_key = str(event['detail']['userIdentity']['userName'])
        client.tag_user(UserName=iam_key_name, Tags=[{'Key': 'PerconaCreatedBy', 'Value': cli_user_used_to_create_iam_key}])
    elif event['detail']['userIdentity']['type'] == 'Root':
         iam_key_name = str(event['detail']['requestParameters']['userName'])
         cli_user_used_to_create_iam_key = str(event['detail']['userIdentity']['arn'])
         client.tag_user(UserName=iam_key_name, Tags=[{'Key': 'PerconaCreatedBy', 'Value': cli_user_used_to_create_iam_key}])
        
    else:
        iam_user_principal_id = str(event['detail']['userIdentity']['principalId'].split(':')[1])
        client.tag_user(UserName=iam_key_name, Tags=[{'Key': 'PerconaCreatedBy', 'Value': iam_user_principal_id}])
    
