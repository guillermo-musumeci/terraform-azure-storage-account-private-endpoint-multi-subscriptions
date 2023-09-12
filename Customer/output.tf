################################
## Azure Provider - Variables ##
################################

# Azure authentication variables

variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "azure-client-id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure-client-secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant ID"
}

# Core Azure authentication variables

variable "core-azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
}

######################
## Network - Output ##
######################

output "network_resource_group_name" {
  value = azurerm_resource_group.network-rg.name
}

output "network_vnet_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "network_endpoint_subnet_name" {
  value = azurerm_subnet.endpoint-subnet.name
}

###############################
## Storage Account - Outputs ##
###############################

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_id" {
    value = azurerm_storage_account.storage.id
}

output "storage_dns_a_record" {
  value = azurerm_private_dns_a_record.dns_a.fqdn
}

output "storage_ip_address" {
  value = azurerm_private_endpoint.endpoint.private_service_connection.0.private_ip_address
}

// USE ONLY for NON-PROD ENVIRONMENTS!!
output "storage_primary_access_key" {
    value = nonsensitive(azurerm_storage_account.storage.primary_access_key)
}

// USE ONLY for NON-PROD ENVIRONMENTS!!
output "storage_primary_connection_string" {
  value = nonsensitive(azurerm_storage_account.storage.primary_connection_string)
}

#########################
## Container - Outputs ##
#########################

output "storage_container_name" {
  value = azurerm_storage_container.meeting.name
}