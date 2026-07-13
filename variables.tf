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
  validation {
    condition = alltrue([
      for k, v in var.api_management_named_values : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_named_values : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_named_values : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
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
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

