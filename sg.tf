module "app_security_group" {
  source             = "terraform-aws-modules/security-group/aws//modules/web"
  version            = "3.12.0"

  name        = "web-server-sg-${var.project_name}-${var.environment}"
  description = "Security group for web-servers with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = module.vpc.public_subnets_cidr_blocks
}

module "lb_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/web"
  version = "3.12.0"

  name = "load-balancer-sg-${var.project_name}-${var.environment}"

  description = "Security group for load balancer with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}