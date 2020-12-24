variable "location" {
  type = string
}
variable "resource_group" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "vnet_cidrs" {
  type = list(string)
}
variable "subnet_name" {
  type = string
}
variable "subnet_cidrs" {
  type = list(string)
}
variable "dns_servers" {
  type = list(string)
}
