#############################
## Application - Variables ##
#############################

# company name 
variable "company" {
  type        = string
  description = "This variable defines thecompany name used to build resources"
}

# Application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

# Environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# Azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "north europe"
}

# Azure short region
variable "shortlocation" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "ne"
}

# DNS Zone resource group name in the core subscription
variable "dns_zone_resource_group_name" {
  type        = string
  description = "Private DNS Zone Name in the Core Azure Account"
  default     = "kopicloud-core-dev-ne-rg"
}

# Private DNS Zone name in the core subscription
variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS Zone Name in the Core Azure Account"
  default     = "privatelink.blob.core.windows.net"
}

#########################
## Network - Variables ##
#########################

variable "network-vnet-cidr" {
  type        = string
  description = "The CIDR of the network VNET"
}

variable "network-endpoint-subnet-cidr" {
  type        = string
  description = "The CIDR for the endpoint subnet"
}
