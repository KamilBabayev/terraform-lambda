resource "aws_lambda_function" "terraform_iam_key_tagger" {
   function_name = "terraform_iam_key_tagger"
   filename = "iam_key_tagger.zip"
  #  handler = "lambda.lambda_handler"
   handler = "iam_key_tagger.lambda_handler"
   runtime = "python3.8"
   role = aws_iam_role.terraform_iam_key_tagger_role.arn
}

resource "aws_iam_role" "terraform_iam_key_tagger_role" {
  name = "terraform_iam_key_tagger_lambda_role"
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

resource "aws_iam_policy" "terraform_iam_key_tagger_policy" {
name = "terraform_iam_key_tagger_policy"

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

resource "aws_iam_policy_attachment" "terraform_iam_key_tagger_policy_attachement" {
  name = "terraform_iam_key_tagger_policy_attachement"
  roles = [ aws_iam_role.terraform_iam_key_tagger_role.name ]
  policy_arn = aws_iam_policy.terraform_iam_key_tagger_policy.arn
}