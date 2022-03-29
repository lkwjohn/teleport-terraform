terraform {
  required_version = ">= 0.14.9"
  backend "s3" {
    bucket = "teleport-state"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

locals {
   env = "${terraform.workspace}"
   vpc_block = var.vpc_block
   subnet_range_app = var.subnet_range_app
}

//module import
module "network" {
    source      = "./modules/core_network"
    vpc_cidr_block   = local.vpc_block
    subnet_range_app = local.subnet_range_app
}



