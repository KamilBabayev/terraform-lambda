resource "aws_lambda_function" "terraform_ec2_tagger" {
   function_name = "terraform_ec2_tagger"
   filename = "ec2_tagger.zip"
  #  handler = "lambda.lambda_handler"
   handler = "ec2_tagger_lambda.lambda_handler"
   runtime = "python3.8"
   role = aws_iam_role.terraform_ec2_tagger_role.arn
}

resource "aws_iam_role" "terraform_ec2_tagger_role" {
   name = "terraform_ec2_tagger_lambda_role"

   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [

    
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_policy" "terraform_ec2_tagger_policy" {
name = "terraform_ec2_tagger_policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "terraform_ec2_tagger_policy_attachement" {
  name = "terraform_ec2_tagger_policy_attachement"
  roles = [ aws_iam_role.terraform_ec2_tagger_role.name ]
  policy_arn = aws_iam_policy.terraform_ec2_tagger_policy.arn
}

# resource "aws_lambda_event_source_mapping" "example" {
#   event_source_arn  = aws_dynamodb_table.example.stream_arn
#   function_name     = aws_lambda_function.example.arn
#   starting_position = "LATEST"
# }