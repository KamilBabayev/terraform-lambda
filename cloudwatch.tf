resource "aws_cloudwatch_event_rule" "terraform_iam_events" {
  name = "terraform_iam_events"
  description = "IAM user management events"
  event_pattern = <<EOF
{
  "source": [
    "aws.iam"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "iam.amazonaws.com"
    ],
    "eventName": [
      "CreateUser",
      "DeleteUser"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_rule" "terraform_rds_events" {
  name = "terraform_rds_events"
  description = "RDS events"
  event_pattern = <<EOF
	{
  "source": [
    "aws.rds"
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "terraform_ec2_events" {
  name = "terraform_ec2_events"
  description = "EC2 created events"
  event_pattern = <<EOF
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "RunInstances",
      "StartInstances",
      "StopInstances"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "terraform_iam_events" {
  rule      = aws_cloudwatch_event_rule.terraform_iam_events.name
  target_id = "terraform_iam_key_tagger"
  arn       = aws_lambda_function.terraform_iam_key_tagger.arn
}

resource "aws_cloudwatch_event_target" "terraform_rds_events" {
  rule      = aws_cloudwatch_event_rule.terraform_rds_events.name
  target_id = "terraform_rds_tagger"
  arn       = aws_lambda_function.terraform_rds_tagger.arn
}

resource "aws_cloudwatch_event_target" "terraform_ec2_events" {
  rule      = aws_cloudwatch_event_rule.terraform_ec2_events.name
  target_id = "terraform_ec2_tagger"
  arn       = aws_lambda_function.terraform_ec2_tagger.arn
}


