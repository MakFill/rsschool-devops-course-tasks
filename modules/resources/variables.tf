variable "AWS_ARN" {
  description = "AWS ARN"
  type        = string
}

variable "REPO" {
  description = "Github repository"
  type        = string
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