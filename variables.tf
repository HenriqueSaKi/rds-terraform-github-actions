variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "user_fiap"
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  default     = "password_fiap"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
