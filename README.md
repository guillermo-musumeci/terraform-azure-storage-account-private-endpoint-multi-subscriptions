# Deploying an Azure Storage Account with a Private Endpoint in Multiple Subscriptions using Terraform

The code is used to provision a central "core" and customer subscriptions.

## Core Subscription

The core subscription will contain the private DNS zones for all subscriptions.

The code, located in **Core** folder, creates:

- Resource Group
- VNET
- Subnet
- Private DNS zone

## Customer Subscription

The customer subscription will contain the application code, in this case, a storage account with a container.

The code, located in the **Customer** folder, uses two credentials, as some components need to write data in the Core subscription:

- Resource Group (Customer)
- VNET (Customer)
- Endpoint Subnet (Customer)
- Virtual Network Link (Core)
- Storage Account (Customer)
- Storage Account Private Endpoint (Customer)
- Storage Account DNS A Record (Core)
- Storage Account Container (Customer)

## Public Access

To configure Public Access, copy the file **storage-account-public-access.tf** from the appropriate folder.

- Allow traffic from public networks --> **Allow_public_access** folder
- Use a white list to filter public access --> **Whitelist_public_access** folder
- Disable traffic from public networks --> **Deny_public_access** folder

## Container

To deploy the container, you must enable public network access or allow your public IP in the whitelist of the Storage account.

If you don't enable public access or your firewall block the traffic to Azure, you will get an error:

```
│ Error: retrieving Container "meeting" (Account "kopiclouddbxdevnesta" / Resource Group "kopicloud-dbx-dev-ne-rg"): containers.Client#GetProperties: Failure responding to request: StatusCode=403 - Original Error: autorest/azure: Service returned an error. Status=403 Code="AuthorizationFailure" Message="This request is not authorized to perform this operation.\nRequestId:ec3320ed-c01e-006c-505d-e59d22000000\nTime:2023–09–12T09:42:23.2964118Z"
│
│ with azurerm_storage_container.meeting,
│ on storage-container.tf line 2, in resource "azurerm_storage_container" "meeting":
│ 2: resource "azurerm_storage_container" "meeting" {
```

The code will get your public IP address and add it to the whitelist automatically.

