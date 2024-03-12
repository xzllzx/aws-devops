# AWS
variable "key_name" {
  type        = string
  description = "Name of private key pair."
}

variable "region" {
  type        = string
  description = "AWS region for all resources."

  default = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "project_log_key" {
  type        = string
  description = "S3 prefix to store project logs"
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the Load Balancer."
}

variable "load_balancer_log_key" {
  type        = string
  description = "S3 prefix to store Load Balancer logs"
}

variable "alb_target_group_name" {
  type        = string
  description = "Name of the project."
}

variable "lb_sg_name" {
  type        = string
  description = "Name of the Load Balancer's Security Group."
}

variable "public_ec2_sg_name" {
  type        = string
  description = "Name of the public EC2 instances' Security Group."
}
variable "private_ec2_sg_name" {
  type        = string
  description = "Name of the private EC2 instances' Security Group."
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block to use for VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones to span VPC across"

  default = ["us-east-1a", "us-east-1b"] # Adjust AZs as needed
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks to use for public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks to use for private subnets"
}

variable "alb_target_group_arn" {
  description = "ALB Target Group's ARN"
  type        = string
}

# Docker
variable "docker_image" {
  description = "Name of the Docker image to pull and run"
  type        = string
}