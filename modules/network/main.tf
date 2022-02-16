terraform {
  required_version = ">=1.1.5"
}


resource "aws_vpc" "vpc_teleport" {
    cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet_teleport" {
    vpc_id =  aws_vpc.vpc_teleport.id
    cidr_block = var.cidr_block
    tags = {
      "Name" = "subnet_teleport"
    }
}
