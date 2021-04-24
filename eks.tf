# data "aws_eks_cluster" "cluster" {
#   name = module.my-cluster.cluster_id
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.my-cluster.cluster_id
# }

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
#   load_config_file       = false
#   version                = "~> 1.9"
# }

# module "my-cluster" {
#   source          = "terraform-aws-modules/eks/aws"
#   cluster_name    = "my-cluster"
#   cluster_version = "1.18"
#   subnets         = ["subnet-06d24627", "subnet-4b0a8114", "subnet-8db2f283"]
#   vpc_id          = "vpc-8dc913f0"

#   workers_group_defaults = {
#   	  root_volume_type = "gp2"
#   }
#   worker_groups = [
#     {
#       instance_type = "m4.large"
#       asg_max_size  = 3
#     }
#   ]
# }