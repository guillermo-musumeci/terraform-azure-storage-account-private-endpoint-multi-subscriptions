#############################
## Private DNS Zone - Main ##
#############################

# Create Private DNS Zone for Storage
resource "azurerm_private_dns_zone" "storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.network-rg.name
}

# Create Private DNS Zone for DFS
resource "azurerm_private_dns_zone" "dfs" {
  name                = "privatelink.dfs.core.windows.net"
  resource_group_name = azurerm_resource_group.network-rg.name
}

# Create Private DNS Zone for Databricks
resource "azurerm_private_dns_zone" "databricks" {
  name                = "privatelink.azuredatabricks.net"
  resource_group_name = azurerm_resource_group.network-rg.name
}

