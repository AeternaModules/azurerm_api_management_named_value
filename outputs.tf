output "api_management_named_values_api_management_name" {
  description = "Map of api_management_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.api_management_name }
}
output "api_management_named_values_display_name" {
  description = "Map of display_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.display_name }
}
output "api_management_named_values_name" {
  description = "Map of name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.name }
}
output "api_management_named_values_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.resource_group_name }
}
output "api_management_named_values_secret" {
  description = "Map of secret values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.secret }
}
output "api_management_named_values_tags" {
  description = "Map of tags values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.tags }
}
output "api_management_named_values_value" {
  description = "Map of value values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.value }
  sensitive   = true
}
output "api_management_named_values_value_from_key_vault" {
  description = "Map of value_from_key_vault values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.value_from_key_vault }
}

