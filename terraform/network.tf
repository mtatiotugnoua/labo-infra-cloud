# ============================================================
# Réseau virtuel Azure (VNet + Subnet)
# ============================================================
# Le VNet isole les ressources dans un réseau privé.
# Le Subnet segmente le VNet en sous-réseaux.
# ============================================================

resource "azurerm_virtual_network" "main" {
  name                = "vnet-labo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet-internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}
