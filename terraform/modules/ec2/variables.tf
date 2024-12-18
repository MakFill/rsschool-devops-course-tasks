variable "ec2_ami" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_instance_type_small" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_1_id" {
  type = string
}

variable "private_subnet_2_id" {
  type = string
}


variable "private_sg_id" {
  type = string
}

variable "public_sg_id" {
  type = string
}