data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "tf_state_policy" {
  bucket     = aws_s3_bucket.tf_state.id
  depends_on = [aws_s3_bucket.tf_state]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowTerraformAccess"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:user/${var.user_name}"
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::tf-state-${random_id.bucket_suffix.hex}",
          "arn:aws:s3:::tf-state-${random_id.bucket_suffix.hex}/*"
        ]
      }
    ]
  })
}
