output "security_group_id" {
  value = tolist(aws_db_instance.mssql-techlanches-instance.vpc_security_group_ids)[0]
}