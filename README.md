# terraform-azure-vm

## Purpose
The purpose of this module is to deploy VM resources in Azure, using Terraform AzureRM provider

## Explanation
Module is deploying resources needed for Azure Linux VM.

## Requirements
* Azure access

If you are using **localy Terraform open source** on MAC/Linux platform or with **Terraform Cloud CLI-driven run** you can achieve this by
1. Run following commands in terminal:
```
export ARM_CLIENT_ID=<your_value>
export ARM_CLIENT_SECRET=<your_value>
export ARM_SUBSCRIPTION_ID=<your_value>
export ARM_TENANT_ID=<your_value>

```
You can verify that variable are set when you run command `export` in same terminal.

2. Create variable set *(only for Terraform Cloud runs)*
Please find detailed guide how to do it [here](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-variable-set).


## Usage and expected input variables
Module can be used in any terraform configuration files with the following example and filled with your values:
```
module "vm" {
  source = "git@github.com:IvanGavrilov777/terraform-azure-vm.git?ref=0.0.1"

  resource_group_name      = 
  location                 = 
  prefix                   = 
  virtual_network_id       = 
  private_subnet_id        = 
  public_subnet_id         = 
  VM_nic1_local_address    = 
  VM_nic2_local_address    = 
  VM_size                  = 
  VM_os_disk_type          = 
  VM_admin_user            = 
  path_to_your_SSH_pub_key = 
}

```
### Terraform Cloud section
In case if you want to use this module in CLI-driven run in Terraform Cloud, you should add ***cloud {} block*** in your terraform block:
```
terraform {
  cloud {
    organization = "<name_of_your_organization>"
    workspaces {
      name = "<name_of_your_workspace>"
    }
  }
}
```

