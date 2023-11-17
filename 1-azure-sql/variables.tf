variable "location" {
  type = string
}
variable "sandbox_id" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "sql_server_name" {
  type = string
}
variable "sql_server_version" {
  type = string
}
variable "administrator_user" {
  type = string
}
variable "administrator_password" {
  type = string
}
variable "tags" {
  type = map(any)
}
variable "database_name" {
  type = string
}
variable "databasse_edition" {
  type = string
}