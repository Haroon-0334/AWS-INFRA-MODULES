variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}


variable "az" {
  type    = string
  default = "ap-south-1a"
}


variable "name_suffix" {
  type    = string
  default = "dev"
}


variable "instance_type" {
  type    = string
  default = "t3.micro"
}


variable "ami" {
  type    = string
  default = "ami-02d26659fd82cf299"
}


variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}


variable "site_bucket_name" {
  type        = string
  description = "Optional: custom S3 bucket name. Leave empty for random suffix."
  default     = ""
}


variable "site_bucket_acl" {
  type    = string
  default = "private"
}


variable "enable_versioning" {
  type    = bool
  default = false
}

variable "account_id" {
  type        = string
  description = "Your AWS account ID"
  sensitive   = true
}

variable "user_name" {
  type        = string
  description = "Your AWS IAM user name"
  default     = "terraform-user"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}
