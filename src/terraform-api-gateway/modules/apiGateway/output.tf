output "url_stage" {
  value = aws_api_gateway_stage.stage_eks.invoke_url
}

output "dns_lb_pedido" {
  value = data.aws_lb.eks_lb_api_pedido.dns_name
}

output "dns_lb_pagamento" {
  value = data.aws_lb.eks_lb_api_pagamento.dns_name
}

output "api_gateway_id" {
  value = aws_api_gateway_rest_api.tech_lanches_api_gateweay.id
}

output "api_gateway_parent_id" {
  value = aws_api_gateway_rest_api.tech_lanches_api_gateweay.root_resource_id
}

output "api_gateway_arn" {
  value = aws_api_gateway_rest_api.tech_lanches_api_gateweay.execution_arn
}