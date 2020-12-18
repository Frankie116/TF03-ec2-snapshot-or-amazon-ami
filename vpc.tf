module "vpc" {
  source           = "terraform-aws-modules/vpc/aws"
  version          = "2.44.0"

  cidr = var.vpc_cidr_block

  azs              = data.aws_availability_zones.available.names
  private_subnets  = slice(var.private_subnet_cidr_blocks, 0, var.private_subnets_per_vpc)
  public_subnets   = slice(var.public_subnet_cidr_blocks, 0, var.public_subnets_per_vpc)

  enable_nat_gateway = true
  enable_vpn_gateway = false
}