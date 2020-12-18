
resource "aws_instance" "app" {
  count                  = var.instances_per_subnet * length(module.vpc.private_subnets)
  ami                    = "${lookup(local.ami-mapping, var.use-snapshot, "No way this should happen")}"
  instance_type          = var.instance_type
  subnet_id              = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]
  vpc_security_group_ids = [module.app_security_group.this_security_group_id]
  user_data              = data.template_file.my-ec2-script.rendered
  tags                   = {
    Terraform            = "true"
    Project              = var.project_name
    Environment          = var.environment
  }
}