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
variable "subnet_ids"{
type = list
default = ["subnet-07038bfa1a0f264c8"]
}
variable "security_group_ids"{
type = list
default = ["sg-0f48c598aabda9992"]
}
variable "ami_id" {
default = "i-0f6299bbe0d996a88"

}
