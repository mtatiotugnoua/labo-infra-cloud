# ============================================================
# Sorties Terraform
# ============================================================
# Ces valeurs seront affichées après `terraform apply`
# et stockées dans l'état Terraform Cloud.
# ============================================================

output "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Région Azure du groupe de ressources"
  value       = azurerm_resource_group.main.location
}

output "vm_public_ip" {
  description = "Adresse IP publique de la VM"
  value       = azurerm_public_ip.vm.ip_address
}

output "vm_ssh_command" {
  description = "Commande SSH pour se connecter à la VM"
  value       = "ssh azureuser@${azurerm_public_ip.vm.ip_address}"
}

output "container_fqdn" {
  description = "FQDN du container Docker"
  value       = azurerm_container_group.main.fqdn
}

output "container_url" {
  description = "URL d'accès au container"
  value       = "http://${azurerm_container_group.main.fqdn}"
}
