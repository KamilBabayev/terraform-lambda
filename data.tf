# data "aws_availability_zones" "available" {}

# data "aws_ami" "centos_8" {
#   most_recent = true
#   owners      = ["297139645035"]

#   filter {
#     name   = "name"
#     values = ["CentOS 8*"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

# }
