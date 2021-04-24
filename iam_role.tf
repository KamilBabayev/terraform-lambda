resource "aws_iam_role" "terraform-sso-aws-gs-sandbox-admin" {
#   name = var.Roles["admin"]
name = "terraform-sso-aws-gs-sandbox-admin"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      name = "Admin"
  }
}


resource "aws_iam_role" "terraform-sso-aws-gs-sandbox-engineer" {
#   name = var.Roles["engineer"]
    name = "terraform-sso-aws-gs-sandbox-engineer"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      name = "Engineer"
  }
}

resource "aws_iam_policy" "terraform-sso-aws-gs-sandbox-admin-policy" { 
name = "terraform-sso-aws-gs-sandbox-admin-policy"

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

resource "aws_iam_policy" "terraform-sso-aws-gs-sandbox-engineer-policy" {
    name = "terraform-sso-aws-gs-sandbox-engineer-policy"

#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }
# EOF

    policy = file("policy.json")

}

resource "aws_iam_policy_attachment" "consultants_admin_attachement" {
  name = "consultants_admin_attachement"
  roles = [ aws_iam_role.terraform-sso-aws-gs-sandbox-admin.name ]
  policy_arn = aws_iam_policy.terraform-sso-aws-gs-sandbox-admin-policy.arn
}

resource "aws_iam_policy_attachment" "consultants_engineer_attachement" {
  name = "consultants_engineer_attachement"
  roles = [ aws_iam_role.terraform-sso-aws-gs-sandbox-engineer.name ]
  policy_arn = aws_iam_policy.terraform-sso-aws-gs-sandbox-engineer-policy.arn
}

