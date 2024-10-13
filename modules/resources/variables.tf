variable "AWS_ARN" {
  type        = string
  description = "AWS ARN"
}

variable "REPO" {
  type        = string
  description = "Github repository"
}

variable "IP" {
  type        = string
  description = "Source IP for Bastion Host"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["eu-west-1a", "eu-west-1b"]
}

variable "default_cidr" {
 type        = string
 default     = "0.0.0.0/0"
}

variable "bastion_ami" {
  type        = string
  description = "Amazon Linux 2023 AMI - Bastion Host"
  default     = "ami-054a53dca63de757b"
}

variable "bastion_instance_type" {
  type        = string
  default     = "t2.micro"
}