
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Location of the resources"
  type        = string
}
variable "prefix" {
  description = "Prefix - to be used for personalization"
  type        = string
}

variable "virtual_network_id" {
  description = "ID of virtual network"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of public subnet"
  type        = string
}

variable "VM_nic1_local_address" {
  description = "Static IP address for VM, if not changed by default in 192.168.1.0/24 subnet"
  type        = string
}

variable "VM_nic2_local_address" {
  description = "Static IP address for VM, if not changed by default in 192.168.100.0/24 subnet"
  type        = string
}

variable "VM_size" {
  description = "Size of the Azure linux virtual machine"
  type        = string
}

variable "VM_os_disk_type" {
  description = "Type of the Azure linux virtual machine disk"
  type        = string
}

variable "VM_admin_user" {
  description = "User account for admin access to VM"
  type        = string
}

variable "path_to_your_SSH_pub_key" {
  description = "Path to your public key from your SSH keypair"
  type        = string
}