provider "aws"{
region = "us-east-1"
}
resource = "aws_vpc" "First_vpc" {
cidr_block = "10.0.0.0/24"
tags = {
Name = "first_Vpc"
}
}
