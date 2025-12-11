provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.2.0.0/16"
  az_count   = 2
}

module "sg" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"
}

module "eks" {
  source             = "../../modules/eks"
  cluster_name       = "tf-eks-prod"
  vpc_id             = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  security_group_id = module.sg.security_group_id
  desired_size       = 3
  min_size           = 2
  max_size           = 10
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
