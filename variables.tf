variable "aws_region" {
  default = "ap-south-1"
}

variable "key_pair_name" {
  default = "devesh-key-pair"
}

variable "public_key_path" {
  default = "devesh-key-pair.pem"
}

variable "ami" {
  default = "ami-0f58b397bc5c1f2e8"
}

variable "master_instance_type" {
  default = "t3a.micro"
}

variable "agent_instance_type" {
  default = "t3a.micro"
}

variable "agent_count" {
  default = 2
}

variable "vpc_id" {
  default = "vpc-0ef500cc401d14783"
}
