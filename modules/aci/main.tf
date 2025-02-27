data "azurerm_client_config" "current" {}


resource "azurerm_subnet" "runners_subnet" {
  name                 = var.subnet-name
  resource_group_name  = var.resourceGroupName
  virtual_network_name = var.vnetName
  address_prefixes     = var.address_prefixes

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}



resource "azurerm_container_group" "self_hosted_runners" {
  depends_on          = [azurerm_subnet.runners_subnet]
  name                = "github-runners"
  location            = var.location
  resource_group_name = var.resourceGroupName
  ip_address_type     = "Private"

  os_type    = "Linux"
  subnet_ids = [azurerm_subnet.runners_subnet.id]

  container {
    name   = "runner"
    image  = "owain.azurecr.io/selfhostedrunner:latest"
    cpu    = "1"
    memory = "1.5"

    environment_variables = { "GH_REPO_URL" : var.gh_repo_url }
    secure_environment_variables = {
      GH_PAT = var.gh_pat
    }
    ports {
      port     = 80 # Not open as private but required for tf creation
      protocol = "TCP"
    }

  }


}
