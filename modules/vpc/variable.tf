variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
}


variable "public_subnet_cidr" {
    type = string
    default = "10.0.1.0/24"
}


variable "az" {
    type = string
    default = "ap-south-1a"
}


variable "name_suffix" {
    type = string
    default = "dev"
}