data "azurerm_key_vault_secret" "value" {
  for_each     = { for k, v in var.api_management_named_values : k => v if v.value_key_vault_id != null && v.value_key_vault_secret_name != null }
  name         = each.value.value_key_vault_secret_name
  key_vault_id = each.value.value_key_vault_id
}
resource "azurerm_api_management_named_value" "api_management_named_values" {
  for_each = var.api_management_named_values

  api_management_name = each.value.api_management_name
  display_name        = each.value.display_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  secret              = each.value.secret
  tags                = each.value.tags
  value               = each.value.value != null ? each.value.value : try(data.azurerm_key_vault_secret.value[each.key].value, null)

  dynamic "value_from_key_vault" {
    for_each = each.value.value_from_key_vault != null ? [each.value.value_from_key_vault] : []
    content {
      identity_client_id = value_from_key_vault.value.identity_client_id
      secret_id          = value_from_key_vault.value.secret_id
    }
  }
}

