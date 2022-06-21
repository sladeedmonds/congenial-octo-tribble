resource "azurerm_kubernetes_cluster" "aks-lab" {
  name                = random_pet.aks.id
  location            = azurerm_resource_group.rg-aks.location
  resource_group_name = azurerm_resource_group.rg-aks.name
  dns_prefix          = "${random_pet.aks.id}-k8s"

  linux_profile {
    admin_username = "slade"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name            = "pool0"
    node_count      = 3
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
    vnet_subnet_id  = azurerm_subnet.subnet-aks.id
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
  }

  tags = {
    environment = "lab"
    deployedBy  = "terraform"
    msftalias   = "sladeedmonds"
  }
}
