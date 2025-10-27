output "role_arn" {
  description = "ARN of the IAM role created for Terraform backend access"
  value       = aws_iam_role.terraform_backend_role.arn
}
