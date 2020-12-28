# resource "aws_iam_role" "ConsultantsAdminRole" {
#   name = var.Roles["admin"]

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF

#   tags = {
#       name = "Admin"
#   }
# }


# resource "aws_iam_role" "ConsultantsEngineerRole" {
#   name = var.Roles["engineer"]

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF

#   tags = {
#       name = "Engineer"
#   }
# }

# resource "aws_iam_policy" "LambdaPolicy" {
# name = "LambdaPolicy"

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
# }

# resource "aws_iam_policy" "ConsultantsEngineerPolicy" {
# name = "ConsultantsEngineerPolicy"

#     policy = file("policy.json")

# }

# resource "aws_iam_policy_attachment" "LambdaPolicyAttachment" {
#   name = "LambdaPolicyAttachment"
#   roles = [ aws_iam_role.lambda_exec.arn ]
#   policy_arn = aws_iam_policy.LambdaPolicy.arn
# }

# resource "aws_iam_policy_attachment" "ConsultantsEngineerAttachment" {
#   name = "ConsultantsEngineerAttachment"
#   roles = [ aws_iam_role.ConsultantsEngineerRole.name ]
#   policy_arn = aws_iam_policy.ConsultantsEngineerPolicy.arn
# }
