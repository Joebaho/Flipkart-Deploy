variable "aws_region" {
  description = "AWS region"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type for web servers"
  type        = string
}
variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}
