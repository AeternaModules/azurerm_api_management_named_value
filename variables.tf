variable "api_management_named_values" {
  description = <<EOT
Map of api_management_named_values, attributes below
Required:
    - api_management_name
    - display_name
    - name
    - resource_group_name
Optional:
    - secret
    - tags
    - value
    - value_from_key_vault (block):
        - identity_client_id (optional)
        - secret_id (required)
EOT

  type = map(object({
    api_management_name = string
    display_name        = string
    name                = string
    resource_group_name = string
    secret              = optional(bool) # Default: false
    tags                = optional(list(string))
    value               = optional(string)
    value_from_key_vault = optional(object({
      identity_client_id = optional(string)
      secret_id          = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_named_values : (
        v.value_from_key_vault == null || (v.value_from_key_vault.identity_client_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.value_from_key_vault.identity_client_id))))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_named_values : (
        v.value == null || (length(v.value) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_named_value's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ApiManagementChildName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
  # path: display_name
  #   source:    [from validate.ApiManagementNamedValueDisplayName] !matched
  # path: value_from_key_vault.secret_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: value_from_key_vault.secret_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
}

