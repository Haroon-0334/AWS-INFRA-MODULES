provider "aws" {
    region = var.region
}


variable "region" {
    description = "AWS region to deploy into"
    type = string
    default = "ap-south-1"
}