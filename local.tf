locals {
  vpc_id = data.aws_vpc.default.id

  private_subnet_ids = [
    for subnet in data.aws_subnets.private.ids : subnet
  ]
}