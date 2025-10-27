terraform {
  backend "s3" {
    bucket         = "tf-state-a6e21cee"
    key            = "global/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table-a6e21cee"
  }
  required_version = ">= 1.0.0"
}

