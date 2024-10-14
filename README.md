# Basic Infrastructure Configuration

This template allows you to to configure the basic networking infrastructure  required for an AWS Kubernetes (K8s) cluster via GitHub Actions Pipeline:
  - VPC
  - 2 public subnets in different AZs
  - 2 private subnets in different AZs
  - Internet Gateway
  - Security Groups and Network ACLs
  - Bastion Host
  - NAT

To use this template:

1. Sign in to your AWS account.

2. In the `main.tf` file update: `bucket`, `key` and `region` fields with related data.

3. In the `modules/resources/variables.tf` file update: `public_subnet_cidrs`, `private_subnet_cidrs`, `azs`, `default_cidr`, `bastion_ami`, `bastion_instance_type`, `key_pair` default values with related data.

4. Add the `AWS_ARN` (your AWS ARN), `REPO` (the name of your GitHub organization) and `ID` (your ID for ssh access) as environment (security) variables.
