######################
## Network - Output ##
######################

output "network_resource_group_name" {
  value = azurerm_resource_group.network-rg.name
}

output "network_vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "network_subnet_name" {
  value = azurerm_subnet.network-subnet.name
}

