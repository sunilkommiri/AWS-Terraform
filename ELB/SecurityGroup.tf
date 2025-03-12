provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "first_SG" {
  vpc_id = aws_vpc.First_vpc.id  # Correcting the reference to the VPC

  ingress {
    from_port   = 80
    to_port     = 80
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
from_port= 8080
to_port= 8080
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
{
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Corrected the typo in "protocol"
    cidr_blocks = ["0.0.0.0/0"]
  }
{
ingress {
from_port= 3000
to_port= 3000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Name = "First_SG"
  }
}
