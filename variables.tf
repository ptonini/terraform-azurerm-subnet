variable "name" {}

variable "rg" {
  type = object({ name = string })
}

variable "vnet" {
  type = object({ name = string })
}

variable "address_prefixes" {
  type = list(string)
}

variable "nat_gateway" {
  default = null
}

variable "service_endpoints" {
  default = []
}

variable "delegation" {
  default = null
  type = object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  })
}