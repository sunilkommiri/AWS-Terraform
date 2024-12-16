provider "aws"{
region = "us-east-1"
}
resource = "aws_security_group" "first_SG"{
vpc_id = aws_vpc.tf.id

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 22
to_port = 22
protocol ="tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
prot0col = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
tags = {
Name = "First_SG"
}
}
