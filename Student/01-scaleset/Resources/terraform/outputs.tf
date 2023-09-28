output "vmss_azure_portal_url" {
  value = "https://portal.azure.com/#@${data.azurerm_client_config.current.tenant_id}/resource${azurerm_orchestrated_virtual_machine_scale_set.vmss_terraform_tutorial.id}/overview"
}