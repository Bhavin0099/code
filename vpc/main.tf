resource "aws_vpc" "new_vpc_block" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_tag
  }
}
