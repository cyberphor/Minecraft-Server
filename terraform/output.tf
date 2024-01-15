output "server_address" {
  value = "${azurerm_container_group.main.fqdn}:${var.container_port}"
}