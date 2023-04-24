variable "rg_name" {
  default = "aks-demo-identity"
}

variable "location" {
  default = "eastus"
}

variable "vnet_name" {
  default = "aks-demo-vnet"
}

variable "address_space" {
  default = "10.10.0.0/16"
}

variable "subnet_name" {
  default = "aks-subnet"
}

variable "default_pool_name" {
  default = "akspool"
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "node_count" {
  default = "1"
}

variable "address_prefix" {
  default = "10.10.1.0/24"
}

variable "cluster_name" {
  default = "aks-identity"
}

variable "dns_prefix" {
  default = "lbabay"
}