# resource "aws_instance" "name" {
#   instance_type = "t2.micro"
#   ami = "ami-00ddb0e5626798373"
# }


# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   name                 = "mydb"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot = true
# }

# resource "aws_iam_user" "lb" {
#   name = "loadbalancer"
#   # path = "/system/"
# }

# resource "aws_iam_access_key" "lb" {
#   user = aws_iam_user.lb.name
# }


# # resource "aws_cloudwatch_log_group" "terraform_ec2_tagger2" {
# #   name = "/aws/lambda/terraform_ec2_tagger2"
# # }