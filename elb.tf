# Comply with ELB name restrictions 
# https://docs.aws.amazon.com/elasticloadbalancing/2012-06-01/APIReference/API_CreateLoadBalancer.html


module "elb_http" {
  source                = "terraform-aws-modules/elb/aws"
  version               = "2.4.0"
  name                  = trimsuffix(substr(replace(join("-", ["lb", random_string.lb_id.result, var.project_name, var.environment]), "/[^a-zA-Z0-9-]/", ""), 0, 32), "-")
  internal              = false
  security_groups       = [module.lb_security_group.this_security_group_id]
  subnets               = module.vpc.public_subnets
  number_of_instances   = length(aws_instance.app)
  instances             = aws_instance.app.*.id
  listener              = [{
    instance_port       = "80"
    instance_protocol   = "HTTP"
    lb_port             = "80"
    lb_protocol         = "HTTP"
  },
  {
    instance_port       = 8080
    instance_protocol   = "TCP"
    lb_port             = 8080
    lb_protocol         = "TCP"
  },
  ]
  health_check          = {
    target              = "HTTP:80/index.html"
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
  }
}