resource "azurerm_api_management_named_value" "api_management_named_values" {
  for_each = var.api_management_named_values

  api_management_name = each.value.api_management_name
  display_name        = each.value.display_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  secret              = each.value.secret
  tags                = each.value.tags
  value               = each.value.value

  dynamic "value_from_key_vault" {
    for_each = each.value.value_from_key_vault != null ? [each.value.value_from_key_vault] : []
    content {
      identity_client_id = value_from_key_vault.value.identity_client_id
      secret_id          = value_from_key_vault.value.secret_id
    }
  }
}

