#####################################
## Storage Account - Public Access ##
#####################################

## Deny Traffic from ALL Public Networks

# Create a white list of IP Addresses
variable "white_list_ip" {
  type        = list(string)
  description = "List of white list of IP Addresses"
  default     = []
}

# Get the Public 
data "http" "ip" {
  url = "https://ifconfig.me/ip"
}

# Output my Public IP Address
output "public_ip_address" {
  value = data.http.ip.response_body
}

# Create Azure Storage Account Network Rules
resource "azurerm_storage_account_network_rules" "rules" {
  provider = azurerm.customer

  storage_account_id = azurerm_storage_account.storage.id
  default_action = "Deny"
  ip_rules       = formatlist(data.http.ip.response_body)
  bypass         = ["Metrics", "Logging", "AzureServices"]
}