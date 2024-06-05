provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "k3s_security_group" {
  name        = "k3s-security-group"
  description = "Security group for K3s cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
  ami           = var.ami
  instance_type = var.master_instance_type
  key_name      = var.key_pair_name
  security_groups = [aws_security_group.k3s_security_group.name]

  tags = {
    Name = "K3s-Master"
  }
}

resource "aws_instance" "agent" {
  count         = var.agent_count
  ami           = var.ami
  instance_type = var.agent_instance_type
  key_name      = var.key_pair_name
  security_groups = [aws_security_group.k3s_security_group.name]

  tags = {
    Name = "K3s-Agent-${count.index + 1}"
  }
}
