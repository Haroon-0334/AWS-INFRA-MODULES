resource "aws_security_group" "instance_sg" {
    name = "tf-instance-sg"
 # set in counts
    description = "Allow SSH and HTTP"
    vpc_id = var.vpc_id


    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.ssh_cidr]
    }


    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
         Name = "tf-instance-sg-${var.name_suffix}" 
         }
}


resource "aws_instance" "this" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.instance_sg.id]
    associate_public_ip_address = true
    tags = { 
        Name = "tf-instance-${var.name_suffix}" 
    }
}