#Create Private Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-vmnic1"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "${var.prefix}-ipconfig1"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.VM_nic1_local_address
  }
}

#Create Public Network Interface
resource "azurerm_network_interface" "nic2" {
  name                = "vmnic2"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "${var.prefix}-ipconfig2"
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
    private_ip_address            = var.VM_nic2_local_address
  }
}

resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.prefix}-vm_public_ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}



#Create Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "nginxVM" {
  name                = "${var.prefix}-nginxVM"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.VM_size
  admin_username      = var.VM_admin_user
  network_interface_ids = [
    azurerm_network_interface.nic.id, azurerm_network_interface.nic2.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.VM_os_disk_type
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  admin_ssh_key {
    username   = var.VM_admin_user
    public_key = file(var.path_to_your_SSH_pub_key)
  }

  custom_data = data.cloudinit_config.config.rendered
}
### Cloudinit config stats here  ->

data "cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = "packages: ['nginx']"
  }
}
