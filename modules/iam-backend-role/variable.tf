variable "state_bucket_name" {
  description = "The S3 bucket used for Terraform state"
  type        = string
}

variable "lock_table_name" {
  description = "The DynamoDB table used for Terraform state locking"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "account_id" {
  description = "Your AWS account ID"
  type        = string
}

variable "trusted_arn" {
  description = "The AWS ARN of the user or service that can assume this role"
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
