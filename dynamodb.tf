resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table-${random_id.bucket_suffix.hex}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-table-${random_id.bucket_suffix.hex}"
  }
}
