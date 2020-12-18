terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws            = {
      source       = "hashicorp/aws"
      version      = "2.69.0"
    }
  }
}



locals {
  ami-mapping      = {
    true           = aws_ami.my-ami.id
    false          = data.aws_ami.amazon_linux.id, 
    
  }
}
data "aws_availability_zones" "available" {
  state            = "available"
}






















