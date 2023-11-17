data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "database-resource-group" {
  name     = "${var.resource_group_name}-${var.sandbox_id}"
  location = var.location
}

resource "azurerm_sql_server" "sql-server" {
  name                         = "${var.sql_server_name}-${var.sandbox_id}"
  resource_group_name          = azurerm_resource_group.database-resource-group.name
  location                     = azurerm_resource_group.database-resource-group.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_user
  administrator_login_password = var.administrator_password

  tags = var.tags

}

resource "azurerm_sql_database" "sql-database" {
  name                = "${var.database_name}-${var.sandbox_id}"
  resource_group_name = azurerm_resource_group.database-resource-group.name
  location            = azurerm_resource_group.database-resource-group.location
  server_name         = azurerm_sql_server.sql-server.name
  edition             = var.databasse_edition

  tags = var.tags
}

resource "azurerm_sql_active_directory_administrator" "example" {
  server_name         = azurerm_sql_server.sql-server.name
  resource_group_name = azurerm_resource_group.database-resource-group.name
  login               = "sqladmin"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}

resource "azurerm_mssql_firewall_rule" "example" {
  name             = "FirewallRule1"
  server_id        = azurerm_sql_server.sql-server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}