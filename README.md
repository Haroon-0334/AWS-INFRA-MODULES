# AWS Infrastructure Modules

This repository contains reusable Terraform modules for AWS infrastructure setup including VPC, EC2, S3, and state management.

## Requirements

- Terraform installed (>= 1.2)
- AWS CLI configured
- AWS credentials with appropriate permissions

## Setup Instructions

1. Clone this repository
2. Copy `terraform.tfvars.example` to `terraform.tfvars`
3. Edit `terraform.tfvars` with your specific values:
   ```hcl
   account_id = "your-aws-account-id"  # Required
   user_name  = "your-iam-username"    # Required
   ```

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Preview changes:
   ```bash
   terraform plan
   ```

6. Apply changes:
   ```bash
   terraform apply
   ```

## Module Structure

- `modules/vpc`: VPC with public subnet
- `modules/ec2`: EC2 instance configuration
- `modules/s3`: S3 bucket with versioning
- `modules/state-backend`: State management with S3 and DynamoDB
- `modules/iam-backend-role`: IAM roles for state management

## Important Security Notes

- Sensitive values should be provided via `terraform.tfvars` (do not commit this file)
- The `ssh_cidr` variable defaults to "0.0.0.0/0" - consider restricting this to your IP
- Review and adjust IAM permissions based on your security requirements
- Enable versioning on S3 buckets in production environments

## Optional Features

1. Static website deployment:
   - Create a `deploy` folder in the repo root
   - Add your website files to this folder
   - They will be automatically synced to the S3 bucket after apply

2. State Backend:
   - The state backend uses S3 for state storage
   - DynamoDB for state locking
   - Encryption enabled by default

## Default Configuration

- Region: ap-south-1 (configurable via `region` variable)
- VPC CIDR: 10.0.0.0/16
- Public Subnet CIDR: 10.0.1.0/24
- Instance Type: t3.micro
- AMI: ami-02d26659fd82cf299 (Amazon Linux 2)