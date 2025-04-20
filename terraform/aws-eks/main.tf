
provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "t2s-eks-cluster"
  cluster_version = "1.29"
  subnets         = ["subnet-xyz"]
  vpc_id          = "vpc-abc"

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}
