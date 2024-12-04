provider "aws" {
  region = "us-east-1"
}

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

resource "aws_security_group" "db_sg" {
  name_prefix = "rds-sg-"
  description = "Allow database access"

  ingress {
    description = "Allow access from ECS tasks"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Modifique conforme sua configuração de VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
