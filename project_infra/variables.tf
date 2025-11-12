variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "keypair"
  type        = string
}
