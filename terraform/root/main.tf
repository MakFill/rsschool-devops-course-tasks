terraform {
  backend "s3" {
    bucket          = "terraform-state-bucket-makfill"
    key             = "tf/state"
    region          = "eu-west-1"
  }
}

module "vpc" {
  source            = "./modules/vpc"

  IP                = var.IP
  default_cidr      = var.default_cidr
}

module "sg" {
  source            = "./modules/sg"

  IP                = var.IP
  default_cidr      = var.default_cidr
}

module "iam" {
  source            = "./modules/sg"

  AWS_ARN           = var.AWS_ARN
  REPO              = var.REPO
}

module "bastion_host" {
  source            = "./modules/bastion_host"

  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  key_pair          = var.key_pair
}

module "ec2" {
  source            = "./modules/ec2"

  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  key_pair          = var.key_pair
}