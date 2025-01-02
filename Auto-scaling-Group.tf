provider "aws"{
region = var.region
}
resource "aws_auto_scaling_group" "first_ASG" {
launch_template {
id = aws_launch_template.first_template.id
version ="$latest"
}
vpc_zone_identifier = var.subnet_ids
min_size = var.min_size
max_size = var.max_size
desired_capacity =var.desired_capacity
health_check_type= "EC2"
health_check_geace_period =300
 tags = [
    {
      key                 = "Name"
      value               = "example-autoscaling-instance"
      propagate_at_launch = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }
}

