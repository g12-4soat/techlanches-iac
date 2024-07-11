output "lambda_arn_inativacao" {
  description = "ARN da lambda"
  value       = aws_lambda_function.tech_lanches_lambda_inativacao.invoke_arn
}

output "nome_lambda_inativacao" {
  description = "Nome da Lambda Inativação"
  value       = aws_lambda_function.tech_lanches_lambda_inativacao.function_name
}