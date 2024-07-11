resource "aws_api_gateway_resource" "inativacao" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.api_gateway_parent_id
  path_part   = "inativacao"
}

resource "aws_api_gateway_method" "inativacao" {
  rest_api_id   = var.api_gateway_id
  resource_id   = aws_api_gateway_resource.inativacao.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_inativacao" {
  rest_api_id             = var.api_gateway_id
  resource_id             = aws_api_gateway_method.inativacao.resource_id
  http_method             = aws_api_gateway_method.inativacao.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.arn_lambda_inativacao
}

resource "aws_api_gateway_deployment" "gateway_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_inativacao
  ]
  rest_api_id = var.api_gateway_id
  stage_name  = var.environment
}

# Saiba mais: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
resource "aws_lambda_permission" "apigateway_lambda_inativacao" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.nome_lambda_inativacao
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_gateway_arn}/*/*"
}

###################################################################################################
