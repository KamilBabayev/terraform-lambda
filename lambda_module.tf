#  keeing this code inside repo temporarily as it works better per my tests.
#  I prefer to use own terraform code that 3rd party modules.

# module "lambda_function" {
#   source = "terraform-aws-modules/lambda/aws"

#   function_name = "my-lambda1"
#   description   = "My awesome lambda function"
#   handler       = "index.lambda_handler"
#   runtime       = "python3.8"

#   # put index.py file inside ./mod/ dir.
#   source_path = "./mod/"

#   tags = {
#     Name = "my-lambda1"
#   }
# }