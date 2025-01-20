provider "aws" {
region = var.region
}

resource "aws_launch_template" "first_template" {
  image_id      = var.ami_id   # Corrected image_id reference
  name_prefix   = "first_template-launch-template"
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                  = var.subnet_ids[0]
    security_groups            = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "first_template"
    }
  }
}
