# Key name
key_name     = "devops"
region       = "us-east-1"
project_name = "load-balanced-nginx"

project_log_key = "aws-devops-zx"

load_balancer_name    = "devops-lb"
load_balancer_log_key = "test-lb"
alb_target_group_name = "WEB-TG"

lb_sg_name          = "lb"
public_ec2_sg_name  = "public-ec2"
private_ec2_sg_name = "private-ec2"

vpc_cidr_block             = "192.168.0.0/16"
availability_zones         = ["us-east-1a", "us-east-1b"]
public_subnet_cidr_blocks  = ["192.168.1.0/24", "192.168.2.0/24"]
private_subnet_cidr_blocks = ["192.168.101.0/24", "192.168.102.0/24"]