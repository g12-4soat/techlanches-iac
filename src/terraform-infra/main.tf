module "cognito" {
  source = "./modules/cognito"
}

module "dynamoDb" {
  source = "./modules/dynamoDb" 
  aws_region = var.region
}

module "rds" {
  source = "./modules/rds"
}

module "eks" {
  source = "./modules/eks"
  security_group_id = module.rds.security_group_id
}