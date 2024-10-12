terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-makfill"
    key    = "tf/state"
    region = "eu-west-1"
  }
}

module "recources" {
  source = "./modules/resources"
}