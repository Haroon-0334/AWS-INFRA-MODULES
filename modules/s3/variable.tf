variable "bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "enable_versioning" {
  type    = bool
  default = false
}
