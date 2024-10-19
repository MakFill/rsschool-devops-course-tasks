variable "ec2_ami" {
  type        = string
  description = "Bastion host - Amazon Linux 2023 AMI"
}

variable "ec2_instance_type" {
  type        = string
}

variable "key_pair" {
  type        = string
}

variable "public_subnet_id" {
  type        = string
}

variable "bastion_sg_id" {
  type        = string
}