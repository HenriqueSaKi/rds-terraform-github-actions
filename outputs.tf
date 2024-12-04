output "db_endpoint" {
  description = "The connection endpoint of the RDS instance"
  value       = aws_db_instance.rds_postgresql.endpoint
}

output "db_username" {
  description = "The username for the RDS instance"
  value       = aws_db_instance.rds_postgresql.username
}