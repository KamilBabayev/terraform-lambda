resource "aws_iam_role" "consultants_admin_role" {
#   name = var.Roles["admin"]
name = "consultants_admin_role"

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


resource "aws_iam_role" "consultants_engineer_role" {
#   name = var.Roles["engineer"]
    name = "consultants_engineer_role"

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

resource "aws_iam_policy" "consultants_admin_policy" {
name = "consultants_admin_policy"

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

resource "aws_iam_policy" "consultants_engineer_policy" {
name = "consultants_engineer_policy"

    policy = file("policy.json")

}

resource "aws_iam_policy_attachment" "consultants_admin_attachement" {
  name = "consultants_admin_attachement"
  roles = [ aws_iam_role.consultants_admin_role.name ]
  policy_arn = aws_iam_policy.consultants_admin_policy.arn
}

resource "aws_iam_policy_attachment" "consultants_engineer_attachement" {
  name = "consultants_engineer_attachement"
  roles = [ aws_iam_role.consultants_engineer_role.name ]
  policy_arn = aws_iam_policy.consultants_engineer_policy.arn
}

