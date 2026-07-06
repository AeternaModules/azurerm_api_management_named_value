output "api_management_named_values" {
  description = "All api_management_named_value resources"
  value       = azurerm_api_management_named_value.api_management_named_values
  sensitive   = true
}
output "api_management_named_values_api_management_name" {
  description = "List of api_management_name values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.api_management_name]
}
output "api_management_named_values_display_name" {
  description = "List of display_name values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.display_name]
}
output "api_management_named_values_name" {
  description = "List of name values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.name]
}
output "api_management_named_values_resource_group_name" {
  description = "List of resource_group_name values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.resource_group_name]
}
output "api_management_named_values_secret" {
  description = "List of secret values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.secret]
}
output "api_management_named_values_tags" {
  description = "List of tags values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.tags]
}
output "api_management_named_values_value" {
  description = "List of value values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.value]
  sensitive   = true
}
output "api_management_named_values_value_from_key_vault" {
  description = "List of value_from_key_vault values across all api_management_named_values"
  value       = [for k, v in azurerm_api_management_named_value.api_management_named_values : v.value_from_key_vault]
}

