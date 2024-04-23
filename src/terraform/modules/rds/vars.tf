variable "regionDefault" {
  default     = "us-east-1"
  description = "Região default do AWS Academy"
}

variable "db-username" {
  default     = "admin"
}

variable "secrets-name" {
  default = "database-credentials"
}

variable "database-name" {
  default = "techlanches"
}