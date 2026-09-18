# ============================================================
# Resource Group Azure
# ============================================================
# Le Resource Group est le conteneur logique qui regroupe
# toutes les ressources Azure du projet.
# ============================================================

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "labo-infra-cloud"
    owner       = "mtatiotugnoua"
  }
}
