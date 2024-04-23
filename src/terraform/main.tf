module "cognito" {
  source = "./modules/cognito"
}

module "lambda" {
  source = "./modules/lambda"
  arn    = data.aws_iam_role.name.arn
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

module "apiGateway" {
  source               = "./modules/apiGateway"
  arn_lambda_auth      = module.lambda.lambda_arn_auth
  arn_lambda_cadastro  = module.lambda.lambda_arn_cadastro
  environment          = var.environment
  nome_lambda_auth     = module.lambda.nome_lambda_auth
  nome_lambda_cadastro = module.lambda.nome_lambda_cadastro
}





# output "url_eks_gateway" {
#   value = module.apiGateway.url_stage
# }
