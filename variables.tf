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
  description = "Source IP for Bastion Host"
}

variable "region" {
  description = "AWS region"
  type        = string
}
