resource "aws_db_instance" "rds_postgresql" {
  identifier = "rds-lanchoente-tf"
  allocated_storage    = 20
  max_allocated_storage = 100
  engine               = "postgres"
  engine_version       = "16.3"
  instance_class       = "db.t4g.micro"
  username             = "user_fiap"
  password             = "password_fiap"
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
  publicly_accessible  = false
  backup_retention_period = 7
  delete_automated_backups = true

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  tags = {
    Name = "Lanchonete-RDS"
  }
}