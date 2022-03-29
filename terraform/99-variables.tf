variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "environment" {
  default = "my-music-teacher-dev"
}
variable "vpc_cidr" {
  default = "10.10.100.0/24"
}
variable "public_subnet_cidr" {
  default = "10.10.100.32/27"
}
variable "public_subnet_1b_cidr" {
  default = "10.10.100.96/27"
}
variable "private_subnet_1a_cidr" {
  default = "10.10.100.128/27"
}
variable "private_subnet_1b_cidr" {
  default = "10.10.100.160/27"
}
variable "private_db_subnet_1a_cidr" {
  default = "10.10.100.192/27"
}
variable "private_db_subnet_1b_cidr" {
  default = "10.10.100.224/27"
}
variable "bucket" {
  default = "my_music_teacher"
}
variable "ami" {
  default = "ami-0b54e0dcc926ae5ce"
}
variable "bucket_name" {
  default = "mymusicteacher"
}
variable "acl_value" {
  default = "private"
}
