module "vpc" {
  source = "./modules/vpc"
  name           = var.name
  vpc_cidr_block = var.vpc_cidr_block
}

module "ecr" {
  source = "./modules/ecr"
  name   = var.name
}