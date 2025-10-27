variable "vpc_id" {
    type = string
}


variable "subnet_id" {
    type = string
}


variable "instance_type" {  
    type = string
    default = "t3.micro"
}


variable "ami" {
    type = string
    default = "ami-02d26659fd82cf299"
}


variable "ssh_cidr" {
    type = string
    default = "0.0.0.0/0"
}


variable "name_suffix" {
    type = string
    default = "dev"
}