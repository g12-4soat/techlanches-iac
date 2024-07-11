resource "aws_lambda_function" "tech_lanches_lambda_inativacao" {
  function_name = "tech-lanches-lambda-inativacao"
  filename      = "../../auth_lambda.zip"
  handler       = "TechLanchesLambda::TechLanchesLambda.Functions_LambdaInativacao_Generated::LambdaInativacao"
  runtime       = "dotnet8"
  role          = var.arn
  tags = {
    Name = "tech-lanches-lambda"
  }
  timeout     = 30
  memory_size = 512
  environment {
    variables = {
      PEDIDO_SERVICE    = var.dns_lb_pedido
      PAGAMENTO_SERVICE  = var.dns_lb_pagamento
    }
  }
}