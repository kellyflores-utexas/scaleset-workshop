resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss_terraform_tutorial" {
  name                        = "vmss-terraform"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  sku_name                    = "Standard_D2s_v4"
  instances                   = var.num_instances
  platform_fault_domain_count = 1         # For zonal deployments, this must be set to 1
  zones                       =  ["1"] # Zones required to lookup zone in the startup script
  # tags                        = var.tags
  
  user_data_base64 = base64encode(file("user-data.sh"))
  os_profile {
    linux_configuration {
      disable_password_authentication = false
      admin_username = "azureuser"
      admin_password = "P@ssword123!"
    }
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-LTS-gen2"
    version   = "latest"
  }
  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                          = "nic"
    primary                       = true
    enable_accelerated_networking = false

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = azurerm_subnet.subnet.id
      # Enable a public ip address on each VM instance to enable direct access to each instance
      public_ip_address {
        name = "vmsspip"
        sku_name = "Standard_Regional"
        version = "IPv4"
      }
    }
  }


  boot_diagnostics {
    storage_account_uri = ""
  }

  # Ignore changes to the instances property, so that the VMSS is not recreated when the number of instances is changed
  lifecycle {
    ignore_changes = [
      instances
    ]
  }
}

