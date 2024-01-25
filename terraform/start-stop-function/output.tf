output "urls" {
  value = [
    "https://${azurerm_linux_function_app.main.default_hostname}/api/start/?",
    "https://${azurerm_linux_function_app.main.default_hostname}/api/stop/?",
  ]
}

output "SUBSCRIPTION_ID" {
  value = data.azurerm_client_config.main.subscription_id
}

output "AZURE_TENANT_ID" {
  value = data.azurerm_client_config.main.tenant_id
}

output "AZURE_CLIENT_ID" {
  value = azuread_application.container_group.application_id
}

output "AZURE_CLIENT_SECRET" {
  value = azuread_service_principal_password.container_group.value
  sensitive = true
}