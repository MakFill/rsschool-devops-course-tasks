terraform {
  backend "s3" {
    bucket            = "terraform-state-bucket-makfill"
    key               = "tf/state"
    region            = "eu-west-1"
  }
}

# module "vpc" {
#   source              = "../modules/vpc"

#   IP                  = var.IP
#   default_cidr        = var.default_cidr
# }

# module "sg" {
#   source              = "../modules/sg"

#   IP                  = var.IP
#   default_cidr        = var.default_cidr
#   main_vpc_id         = module.vpc.main_vpc_id
#   main_vpc_cidr_block = module.vpc.main_vpc_cidr_block
# }

# module "iam" {
#   source              = "../modules/iam"

#   AWS_ARN             = var.AWS_ARN
#   REPO                = var.REPO
# }

# module "bastion_host" {
#   source              = "../modules/bastion_host"

#   ec2_ami             = var.ec2_ami
#   ec2_instance_type   = var.ec2_instance_type
#   key_pair            = var.key_pair
#   public_subnet_id    = module.vpc.public_subnet_1_id
#   bastion_sg_id       = module.sg.bastion_sg_id
# }

# module "ec2" {
#   source              = "../modules/ec2"

#   ec2_ami             = var.ec2_ami
#   ec2_instance_type   = var.ec2_instance_type
#   key_pair            = var.key_pair
#   public_subnet_id    = module.vpc.public_subnet_2_id
#   private_subnet_id   = module.vpc.private_subnet_1_id
#   public_sg_id        = module.sg.public_sg_id
#   private_sg_id       = module.sg.private_sg_id
# }