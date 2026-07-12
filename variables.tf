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
      public_ip_count = optional(number) # Default: 1
      virtual_hub_id  = string
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_firewall's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.FirewallName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
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
  # path: sku_name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: sku_tier
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: firewall_policy_id
  #   source:    [from firewallpolicies.ValidateFirewallPolicyID] !ok
  # path: firewall_policy_id
  #   source:    [from firewallpolicies.ValidateFirewallPolicyID] err != nil
  # path: ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ip_configuration.subnet_id
  #   source:    [from validate.FirewallSubnetName] err != nil
  # path: ip_configuration.subnet_id
  #   source:    [from validate.FirewallSubnetName] parsed.SubnetName != "AzureFirewallSubnet"
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: management_ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: management_ip_configuration.subnet_id
  #   source:    [from validate.FirewallManagementSubnetName] err != nil
  # path: management_ip_configuration.subnet_id
  #   source:    [from validate.FirewallManagementSubnetName] parsed.SubnetName != "AzureFirewallManagementSubnet"
  # path: management_ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: management_ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: threat_intel_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dns_servers[*]
  #   source:    validation.IsIPAddress(...) - no translation rule yet, add one
  # path: private_ip_ranges[*]
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: virtual_hub.virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] !ok
  # path: virtual_hub.virtual_hub_id
  #   source:    [from virtualwans.ValidateVirtualHubID] err != nil
  # path: virtual_hub.public_ip_count
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

