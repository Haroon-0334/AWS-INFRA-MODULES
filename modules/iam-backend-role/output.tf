output "role_arn" {
  value = aws_iam_role.terraform_backend_role.arn
}

output "policy_arn" {
  value = aws_iam_policy.terraform_backend_policy.arn
}
