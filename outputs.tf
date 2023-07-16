
output "vm_public_ip_address" {
  description = "Output the public IP address of the VM"
  value       = azurerm_public_ip.vm_public_ip.ip_address
}

output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "ip_configuration_name" {
  value = azurerm_network_interface.nic.ip_configuration.0.name
}
