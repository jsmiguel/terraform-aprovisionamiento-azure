data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "database-resource-group" {
  name     = "${var.resource_group_name}-${var.sandbox_id}-0"
  location = var.location
}

resource "azurerm_mssql_server" "sql-server" {
  name                         = "${var.sql_server_name}-${var.sandbox_id}-0"
  resource_group_name          = azurerm_resource_group.database-resource-group.name
  location                     = azurerm_resource_group.database-resource-group.location
  version                      = var.sql_server_version
  administrator_login          = var.administrator_user
  administrator_login_password = var.administrator_password
  azuread_administrator {
    login_username = "sqladmin"
    object_id      = data.azurerm_client_config.current.object_id
  }

  tags = var.tags

}

resource "azurerm_mssql_database" "sql-database" {
  count = 3
  name           = "${var.database_name}-${var.sandbox_id}-${count.index}"
  server_id      = azurerm_mssql_server.sql-server.id
  license_type   = "LicenseIncluded"
  sku_name       = "Basic"
  tags           = var.tags
}

resource "azurerm_mssql_firewall_rule" "example" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.sql-server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}