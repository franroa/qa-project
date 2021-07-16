resource "azurerm_network_interface" "my-vm-interface" {
  name                = "my-vm-interface"
  location            = var.location
  resource_group_name = var.resrouce_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_linux_virtual_machine" "my-vm" {
  name                = "my-vm"
  location            = var.location
  resource_group_name = var.resrouce_group_name
  size                = "Standard_B1s"
  admin_username      = "franroa"
  network_interface_ids = [azurerm_network_interface.my-vm-interface.id]

  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "franroa"
    public_key = file("~/.ssh/gitlab_course.pub")
  }
}
