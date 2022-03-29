terraform {
  required_version = ">=1.1.5"
}


resource "aws_vpc" "pg_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
}

resource "aws_subnet" "pg_subnet_app" {
    vpc_id =  aws_vpc.pg_vpc.id
    cidr_block = var.subnet_range_app
    tags = {
      "Name" = "pg-${terraform.workspace}-subnet-app"
    }
}

# resource "aws_vpc_endpoint" "ssm" {
#   vpc_id       = aws_vpc.vpc_teleport.id
#   service_name = "com.amazonaws.ap-southeast-1.ssm"
#   subnet_ids   = [aws_subnet.subnet_teleport.id]
#   vpc_endpoint_type = "Interface"
#   security_group_ids = [
#     aws_security_group.allow_outbound.id,
#   ]
# }

# resource "aws_vpc_endpoint" "ec2messages" {
#   vpc_id       = aws_vpc.vpc_teleport.id
#   service_name = "com.amazonaws.ap-southeast-1.ec2messages"
#   subnet_ids   = [aws_subnet.subnet_teleport.id]
#   vpc_endpoint_type = "Interface"
#   security_group_ids = [
#     aws_security_group.allow_outbound.id,
#   ]
# }

# resource "aws_vpc_endpoint" "ssmmessages" {
#   vpc_id       = aws_vpc.vpc_teleport.id
#   service_name = "com.amazonaws.ap-southeast-1.ssmmessages"
#   subnet_ids   = [aws_subnet.subnet_teleport.id]
#   vpc_endpoint_type = "Interface"
#   security_group_ids = [
#     aws_security_group.allow_outbound.id,
#   ]
# }