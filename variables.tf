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
    - value_key_vault_id (alternative to value - read from Key Vault instead)
    - value_key_vault_secret_name (alternative to value - read from Key Vault instead)
    - value_from_key_vault (block):
        - identity_client_id (optional)
        - secret_id (required)
EOT

  type = map(object({
    api_management_name         = string
    display_name                = string
    name                        = string
    resource_group_name         = string
    secret                      = optional(bool)
    tags                        = optional(list(string))
    value                       = optional(string)
    value_key_vault_id          = optional(string)
    value_key_vault_secret_name = optional(string)
    value_from_key_vault = optional(object({
      identity_client_id = optional(string)
      secret_id          = string
    }))
  }))
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
  # path: value_from_key_vault.identity_client_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: value
  #   condition: length(value) > 0
  #   message:   must not be empty
}

