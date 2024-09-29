terraform {
  backend "s3" {
    bucket = var.bucket_name
    key    = "tf/state"
    region = var.region
  }
}