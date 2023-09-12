# Create a container in the Storage Account
resource "azurerm_storage_container" "meeting" {
  provider = azurerm.customer

  name                  = "meeting"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}