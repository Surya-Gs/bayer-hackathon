variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "tf-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version to use for the cluster"
  type        = string
  default     = "1.28"
}

variable "node_group_name" {
  description = "EKS node group name"
  type        = string
  default     = "tf-node-group"
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 5
}

variable "instance_types" {
  description = "Instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for cluster"
  type        = string
}
