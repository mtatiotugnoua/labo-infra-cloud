# ============================================================
# Machine virtuelle Linux Azure
# ============================================================
# Composée de 3 ressources :
#   1. IP publique (pour accéder à la VM depuis Internet)
#   2. Interface réseau (pour connecter la VM au subnet)
#   3. VM Linux (Ubuntu 22.04 LTS)
# ============================================================

# --- IP publique ---
resource "azurerm_public_ip" "vm" {
  name                = "pip-vm-labo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
  sku                 = "Standard"

  tags = {
    environment = var.environment
  }
}

# --- Interface réseau ---
resource "azurerm_network_interface" "vm" {
  name                = "nic-vm-labo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
  }

  tags = {
    environment = var.environment
  }
}

# --- Machine virtuelle Linux ---
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-labo"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.vm.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }
}
