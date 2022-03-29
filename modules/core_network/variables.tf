variable "vpc_cidr_block" {
    type = string
    description = "VPC cidr block"   
}

variable "subnet_range_app" {
  type = string
  description = "CIDR block for teleport subnet"
}