resource "azurerm_subnet" "this" {
  name                 = var.name
  resource_group_name  = var.rg.name
  virtual_network_name = var.vnet.name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.service_endpoints

  dynamic "delegation" {
    for_each = var.delegation[*]
    content {
      name = delegation.value.name

      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}

resource "azurerm_subnet_nat_gateway_association" "this" {
  count          = var.nat_gateway == null ? 0 : 1
  subnet_id      = azurerm_subnet.this.id
  nat_gateway_id = var.nat_gateway
}