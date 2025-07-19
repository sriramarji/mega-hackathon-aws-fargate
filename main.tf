module "vpc" {
  source = "./modules/vpc"
  name           = var.name
  vpc_cidr_block = var.vpc_cidr_block
}

module "ecr" {
  source = "./modules/ecr"
  name   = var.name
}

module "ecs" {
  source = "./modules/ecs"
  name   = var.name
  ecr_repo_url = [module.ecr.ecr_repo_url_1, module.ecr.ecr_repo_url_2]
  subnets = module.vpc.public_subnets
  security_group_ids = [module.security_group.ecs_sg]
  ecs_role_arn     = module.iam.ecs_role_arn
  target           = [module.alb.target_1, module.alb.target_2]
  appointment_service = module.cloudwatch.appointment_service_log_group_name
  patient_service     = module.cloudwatch.patient_service_log_group_name
}

module "iam" {
  source = "./modules/iam"
  name   = var.name
}

