variable "arn" {
  description = "ARN da labRole"
  type        = string
}

variable "dns_lb_pagamento" {
  description = "DNS do load balancer de pagamento"
  type = string
}

variable "dns_lb_pedido" {
  description = "DNS do load balancer de pedido"
  type = string
}