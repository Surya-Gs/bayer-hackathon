variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of AZs to create subnets across"
  type        = number
  default     = 2
}

variable "public_subnet_bits" {
  description = "Number of additional bits for public subnet CIDR"
  type        = number
  default     = 8
}

variable "private_subnet_bits" {
  description = "Number of additional bits for private subnet CIDR"
  type        = number
  default     = 8
}
