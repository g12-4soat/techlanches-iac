provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "pagamentos" {
  name           = "pagamentos"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Id"


  attribute {
    name = "Id"
    type = "S"
  }

 attribute {
    name = "PedidoId"
    type = "N"
  }
  # Definição do índice global secundário
  global_secondary_index {
    name               = "pedidoIdIndex"
    hash_key           = "PedidoId"
    projection_type    = "ALL"  # Projetar todos os atributos
  }

  tags = {
    Name        = "DynamoDB do TechLanches Serviço de Pagamento"
    Repository  = "https://github.com/g12-4soat/techlanches-iac"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }
}

resource "aws_dynamodb_table" "outboxMessage" {
  name           = "outboxMessage"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Id"


  attribute {
    name = "Id"
    type = "S"
  }

 attribute {
    name = "PagamentoId"
    type = "S"
  }
  # Definição do índice global secundário
  global_secondary_index {
    name               = "pagamentoIdIndex"
    hash_key           = "PagamentoId"
    projection_type    = "ALL"  # Projetar todos os atributos
  }

  tags = {
    Name        = "DynamoDB do TechLanches Serviço de Pagamento Outbox"
    Repository  = "https://github.com/g12-4soat/techlanches-iac"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }
}