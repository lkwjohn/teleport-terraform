terraform {
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

//module import
module "teleport_network_setup" {
    source      = "./modules/network"
    vpc_cidr_block = "10.1.0.0/16"
    cidr_block  = "10.1.5.0/28"
}



