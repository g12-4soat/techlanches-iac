resource "aws_db_instance" "mssql-techlanches-instance" {
  identifier           = "mssql-techlanches-instance"
  engine               = "sqlserver-ex"
  parameter_group_name = "default.sqlserver-ex-15.0"
  engine_version       = "15.00.4043.16.v1"
  instance_class       = "db.t3.medium" # Eligible for AWS Free Tier
  storage_type         = "gp2"
  allocated_storage    = 20
  username             = var.db-username
  password             = random_password.master_password.result
  publicly_accessible  = true # Enable public accessibility

  tags = {
    Name        = "MSSQL Server do TechLanches Serviço de Pedidos e Produtos"
    Repository  = "https://github.com/g12-4soat/techlanches-iac"
    Environment = "Prod"
    ManagedBy   = "Terraform"
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
