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

resource "azuread_service_principal" "aks-service-principal" {

}

resource "azurerm_role_assignment" "acr-pull" {
  
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  location = var.location 
  name = var.cluster_name 
  resource_group_name = var.rg_name
  public_network_access_enabled = true 
  
  default_node_pool {
    name = var.default_pool_name 
    vm_size = var.vm_size 
    enable_auto_scaling = false 
    node_count = var.node_count
  }
}
