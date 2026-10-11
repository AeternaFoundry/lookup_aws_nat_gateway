data "aws_nat_gateway" "nat_gateway_lookup" {
  for_each = var.nat_gateway_lookup

  region    = each.value.region
  state     = each.value.state
  subnet_id = each.value.subnet_id
  tags      = each.value.tags
  vpc_id    = each.value.vpc_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

