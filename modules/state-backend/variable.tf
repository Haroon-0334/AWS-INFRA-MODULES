variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "user_name" {
  description = "IAM user name that will assume this role"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table for Terraform locks"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role for Terraform backend"
  type        = string
  default     = "terraform-backend-role"
}

variable "policy_name" {
  description = "Name of the IAM policy for Terraform backend"
  type        = string
  default     = "terraform-backend-policy"
}
