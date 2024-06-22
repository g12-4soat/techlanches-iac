resource "aws_cognito_user_pool" "tech_lanches_clientes_pool" {
  name                     = "tech-lanches-clientes-pool"
  mfa_configuration        = "OFF"
  alias_attributes         = ["email", "preferred_username"]
  auto_verified_attributes = ["email"]

  username_configuration {
    case_sensitive = false
  }

  schema {
    attribute_data_type = "String"
    name = "phone_number"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      max_length = 14
      min_length = 13
    }
  }

  schema {
    attribute_data_type = "String"
    name = "address"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      max_length = 80
      min_length = 10
    }
  }

  tags = {
    Name = "tech_lanches_clientes_pool"
  }
}

resource "aws_cognito_user_pool_client" "tech_lanches_clientes_pool_client" {
  name                = "pool-client"
  explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_ADMIN_USER_PASSWORD_AUTH"]
  user_pool_id        = aws_cognito_user_pool.tech_lanches_clientes_pool.id
}