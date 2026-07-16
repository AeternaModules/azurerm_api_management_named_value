output "api_management_named_values_id" {
  description = "Map of id values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_management_named_values_api_management_name" {
  description = "Map of api_management_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.api_management_name if v.api_management_name != null && length(v.api_management_name) > 0 }
}
output "api_management_named_values_display_name" {
  description = "Map of display_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "api_management_named_values_name" {
  description = "Map of name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.name if v.name != null && length(v.name) > 0 }
}
output "api_management_named_values_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "api_management_named_values_secret" {
  description = "Map of secret values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.secret if v.secret != null }
}
output "api_management_named_values_tags" {
  description = "Map of tags values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "api_management_named_values_value" {
  description = "Map of value values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.value if v.value != null && length(v.value) > 0 }
  sensitive   = true
}
output "api_management_named_values_value_from_key_vault" {
  description = "Map of value_from_key_vault values across all api_management_named_values, keyed the same as var.api_management_named_values"
  value       = { for k, v in azurerm_api_management_named_value.api_management_named_values : k => v.value_from_key_vault if v.value_from_key_vault != null && length(v.value_from_key_vault) > 0 }
}

