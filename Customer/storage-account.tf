############################
## Storage Account - Main ##
############################

locals {
  sta_name = "${lower(replace(var.company," ","-"))}${var.app_name}${var.environment}${var.shortlocation}sta"
}

# Create Private DNS Zone Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "network_link" {
  provider = azurerm.core

  name                  = "${local.sta_name}-vlink"
  resource_group_name   = var.dns_zone_resource_group_name
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = azurerm_virtual_network.network-vnet.id

  tags = {
    application = var.app_name
    environment = var.environment
  }

  depends_on = [ azurerm_virtual_network.network-vnet ]
}

# Create Storage Account
resource "azurerm_storage_account" "storage" {
  provider = azurerm.customer

  name                = local.sta_name
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    application = var.app_name
    environment = var.environment
  }

  depends_on = [ azurerm_resource_group.network-rg ]
}

# Create Private Endpint
resource "azurerm_private_endpoint" "endpoint" {
  provider = azurerm.customer

  name                = "${local.sta_name}-pe"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  subnet_id           = azurerm_subnet.endpoint-subnet.id

  private_service_connection {
    name                           = "${local.sta_name}-psc"
    private_connection_resource_id = azurerm_storage_account.storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = {
    application = var.app_name
    environment = var.environment
  }

  depends_on = [ azurerm_subnet.endpoint-subnet ]
}

# Create DNS A Record
resource "azurerm_private_dns_a_record" "dns_a" {
  provider = azurerm.core

  name                = local.sta_name
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.endpoint.private_service_connection.0.private_ip_address]

  tags = {
    application = var.app_name
    environment = var.environment
  }
}
