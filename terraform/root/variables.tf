variable "AWS_ARN" {
  description = "AWS ARN"
  type        = string
}

variable "REPO" {
  description = "Github repository"
  type        = string
}

variable "IP" {
  type        = string
  description = "Source IP for private access"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "default_cidr" {
 type        = string
}

variable "ec2_ami" {
  type        = string
  description = "Amazon Linux 2023 AMI"
}

variable "ec2_instance_type" {
  type        = string
}

variable "key_pair" {
  type        = string
}
