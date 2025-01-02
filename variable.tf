variable "region" {
  default = "us-east-1"
}
variable "min_size" {
  default = 1
}
variable "max_size" {
  default = 3
}
variable "desired_capacity" {
  default = 2 
}
variaable "submet_ids"{
type = list
default = ["subnetid"]
}
variable "security_group_id"{
type = list 
default = ["security_group_id"]
}
variable ami_id{
default = image_id 
}
