resource "aws_secretsmanager_secret" "rds_credentials" {
  name = var.secrets-name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({
    Username: aws_db_instance.mssql-techlanches-instance.username,
    Password: random_password.master_password.result,
    Host: aws_db_instance.mssql-techlanches-instance.address,
    Port: aws_db_instance.mssql-techlanches-instance.port,
    Database: var.database-name
    Engine: aws_db_instance.mssql-techlanches-instance.engine,
  })
}
