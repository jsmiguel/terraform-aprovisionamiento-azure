data "mssql_database" "my-database" {
  name = "${var.database_name}-${var.sandbox_id}"
}
resource "mssql_script" "cdc" {
  database_id   = data.mssql_database.my-database.id
  read_script   = <<SQL
   SELECT COUNT(*) as [if_exist] 
   FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '${var.table_name}'
  SQL
  update_script = <<SQL
    CREATE TABLE ${var.table_name} (
        PersonID int,
        LastName varchar(255),
        FirstName varchar(255),
        Address varchar(255),
        Address2 varchar(255),
        City varchar(255)
    );
    SQL
  state = {
    if_exist = "1"
  }
}

# Verify if Table exists
data "mssql_query" "table_exist" {
  database_id = data.mssql_database.my-database.id
  query       = <<SQL
   SELECT COUNT(*) as [if_exist] 
   FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = '${var.table_name}'
  SQL
}
output "table_exist" {
    value = data.mssql_query.table_exist.result
}

# Query to get table's columns 
data "mssql_query" "column" {
  database_id = data.mssql_database.my-database.id
  query       = "SELECT [column_id], [name] FROM sys.columns WHERE [object_id] = OBJECT_ID('${var.table_name}')"
}

output "column_names" {
  value = data.mssql_query.column.result
}