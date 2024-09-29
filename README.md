# Terraform Backend Template with State Stored in AWS S3

This template allows you to create an IAM policy and an S3 bucket via GitHub Actions.

To use this template:

1. Sign in to your AWS account.


2. Manually create an S3 bucket for the state.


3. Change `bucket_name` and `region` in the terraform.tfvars file accordingly.


4. Add the `AWS_ARN` (your AWS ARN) and `REPO` (the name of your GitHub organization) as environment (security) variables.

