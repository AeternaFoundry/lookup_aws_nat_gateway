variable "nat_gateway_lookup" {
  description = <<EOT
Map of nat_gateway_lookup, attributes below
Optional:
    - region
    - state
    - subnet_id
    - tags
    - vpc_id
    - filter (block):
        - name (required)
        - values (required)
EOT

  type = map(object({
    region    = optional(string)
    state     = optional(string)
    subnet_id = optional(string)
    tags      = optional(map(string))
    vpc_id    = optional(string)
    filter = optional(list(object({
      name   = string
      values = set(string)
    })))
  }))
}

