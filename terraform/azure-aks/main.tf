
provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "t2s_aks" {
  name                = "t2s-aks-cluster"
  location            = "East US"
  resource_group_name = "t2s-rg"
  dns_prefix          = "t2saks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
