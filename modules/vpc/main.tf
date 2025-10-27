resource "aws_vpc" "this" {
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "tf-vpc-${var.name_suffix}"
    }
}


resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.az
    map_public_ip_on_launch = true
    tags = { 
        Name = "tf-public-subnet-${var.name_suffix}" 
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.this.id
    tags = { 
        Name = "tf-igw-${var.name_suffix}" 
    }
}


resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = { 
        Name = "tf-rt-public-${var.name_suffix}" 
    }
}


resource "aws_route_table_association" "public_assoc" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}