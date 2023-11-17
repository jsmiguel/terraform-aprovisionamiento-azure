terraform {
  required_providers {
    mssql = {
      source  = "PGSSoft/mssql"
      version = "0.6.0"
    }
  }
}

#https://registry.terraform.io/providers/PGSSoft/mssql/latest/docs
provider "mssql" {
  hostname = "${var.sql_server_name}-${var.sandbox_id}.database.windows.net"
  port     = 1433

  azure_auth = {

    client_id = "a4b70489-5962-49f6-85e2-5c9b4a66fce6"
    tenant_id = "2cddd894-138f-433f-8fcc-69112c0f4bc6"

  }
}