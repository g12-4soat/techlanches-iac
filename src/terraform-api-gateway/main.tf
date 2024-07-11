module "lambda" {
  source = "./modules/lambda"
  arn    = data.aws_iam_role.name.arn
}

module "apiGateway" {
  source                 = "./modules/apiGateway"
  arn_lambda_auth        = module.lambda.lambda_arn_auth
  arn_lambda_cadastro    = module.lambda.lambda_arn_cadastro
  environment            = var.environment
  nome_lambda_auth       = module.lambda.nome_lambda_auth
  nome_lambda_cadastro   = module.lambda.nome_lambda_cadastro
}

module "lambda-inativacao" {
  source = "./modules/lambda-inativacao"
  arn    = data.aws_iam_role.name.arn
  dns_lb_pedido = module.apiGateway.dns_lb_pedido
  dns_lb_pagamento = module.apiGateway.dns_lb_pagamento
}

module "apiGateway-inativacao" {
  source = "./modules/apiGateway-inativacao"
  arn_lambda_inativacao  = module.lambda-inativacao.lambda_arn_inativacao
  nome_lambda_inativacao = module.lambda-inativacao.nome_lambda_inativacao
  api_gateway_id = module.apiGateway.api_gateway_id
  api_gateway_parent_id = module.apiGateway.api_gateway_parent_id
  api_gateway_arn = module.apiGateway.api_gateway_arn
  environment  = var.environment
}

output "url_eks_gateway" {
  value = module.apiGateway.url_stage
}