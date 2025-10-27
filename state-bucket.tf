resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-${random_id.bucket_suffix.hex}"
  region = var.region

  tags = {
    Name = "tf-state-${random_id.bucket_suffix.hex}"
  }
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  region = var.region

  versioning_configuration {
    status = "Enabled"
  }
}
