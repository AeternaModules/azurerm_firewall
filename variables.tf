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
    ip_configuration = optional(object({
      name                 = string
      public_ip_address_id = optional(string)
      subnet_id            = optional(string)
    }))
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
}

