variable "firewalls" {
  description = <<EOT
Map of firewalls, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku_name
    - sku_tier
Optional:
    - dns_proxy_enabled
    - dns_servers
    - firewall_policy_id
    - private_ip_ranges
    - tags
    - threat_intel_mode
    - zones
    - ip_configuration (block):
        - name (required)
        - public_ip_address_id (optional)
        - subnet_id (optional)
    - management_ip_configuration (block):
        - name (required)
        - public_ip_address_id (required)
        - subnet_id (required)
    - virtual_hub (block):
        - public_ip_count (optional)
        - virtual_hub_id (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    sku_tier            = string
    dns_proxy_enabled   = optional(bool)
    dns_servers         = optional(list(string))
    firewall_policy_id  = optional(string)
    private_ip_ranges   = optional(set(string))
    tags                = optional(map(string))
    threat_intel_mode   = optional(string)
    zones               = optional(set(string))
    ip_configuration = optional(list(object({
      name                 = string
      public_ip_address_id = optional(string)
      subnet_id            = optional(string)
    })))
    management_ip_configuration = optional(object({
      name                 = string
      public_ip_address_id = string
      subnet_id            = string
    }))
    virtual_hub = optional(object({
      public_ip_count = optional(number)
      virtual_hub_id  = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        v.ip_configuration == null || alltrue([for item in v.ip_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        v.management_ip_configuration == null || (length(v.management_ip_configuration.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        v.virtual_hub == null || (v.virtual_hub.public_ip_count == null || (v.virtual_hub.public_ip_count >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        v.zones == null || (alltrue([for x in v.zones : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.firewalls : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 23 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

