# AWS Region
variable "region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

# VPC CIDR Block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet CIDR increment
variable "subnet_bits" {
  description = "Subnet bits used for subnet CIDR calculation"
  type        = number
  default     = 8
}

# Instance type for worker nodes
variable "instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  type        = string
  default     = "t3.medium"
}

# Node group scaling configuration
variable "desired_size" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 3
}

variable "max_size" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}
# SSH Key Pair Name
variable "ssh_key_name" {
  description = "Name of the SSH key pair for EC2 instances"
  type        = string
  default     = "keypair"
}
