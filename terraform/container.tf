# ============================================================
# Azure Container Instance (Docker)
# ============================================================
# Déploie un container nginx accessible publiquement.
# ============================================================

resource "azurerm_container_group" "main" {
  name                = "aci-labo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  dns_name_label      = "labo-container-mtatiotugnoua"
  os_type             = "Linux"

  container {
    name   = "nginx"
    image  = "nginx:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = var.environment
  }
}
