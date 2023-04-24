/*
The code below provisions the most basic AKS cluster that has a system assigned managed identity associated with it.
*/
resource "azurerm_resource_group" "aks-group" {
  name = var.rg_name 
  location = var.location
}

resource "azurerm_virtual_network" "aks-vnet" {
  name = var.vnet_name 
  location = var.location 
  resource_group_name = var.rg_name 
  address_space = [var.address_space]

  subnet { 
      name = var.subnet_name 
      address_prefix = var.address_prefix
  }
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  location = azurerm_resource_group.aks-group.location
  name = var.cluster_name 
  resource_group_name = azurerm_resource_group.aks-group.name
  public_network_access_enabled = true 
  dns_prefix = var.dns_prefix
  
  default_node_pool {
    name = var.default_pool_name 
    vm_size = var.vm_size 
    enable_auto_scaling = false 
    node_count = var.node_count
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }

  identity {
    type = "SystemAssigned"
  }
  depends_on = [
    azurerm_resource_group.aks-group
  ]
}

resource "azuread_user" "devuser1" {
    user_principal_name = "devuser1@landonbabayoutlook.onmicrosoft.com"
    display_name = "devuser1"
    password = "testPassword123!"
}

