output "firewalls_dns_proxy_enabled" {
  description = "Map of dns_proxy_enabled values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.dns_proxy_enabled }
}
output "firewalls_dns_servers" {
  description = "Map of dns_servers values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.dns_servers }
}
output "firewalls_firewall_policy_id" {
  description = "Map of firewall_policy_id values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.firewall_policy_id }
}
output "firewalls_ip_configuration" {
  description = "Map of ip_configuration values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.ip_configuration }
}
output "firewalls_location" {
  description = "Map of location values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.location }
}
output "firewalls_management_ip_configuration" {
  description = "Map of management_ip_configuration values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.management_ip_configuration }
}
output "firewalls_name" {
  description = "Map of name values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.name }
}
output "firewalls_private_ip_ranges" {
  description = "Map of private_ip_ranges values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.private_ip_ranges }
}
output "firewalls_resource_group_name" {
  description = "Map of resource_group_name values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.resource_group_name }
}
output "firewalls_sku_name" {
  description = "Map of sku_name values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.sku_name }
}
output "firewalls_sku_tier" {
  description = "Map of sku_tier values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.sku_tier }
}
output "firewalls_tags" {
  description = "Map of tags values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.tags }
}
output "firewalls_threat_intel_mode" {
  description = "Map of threat_intel_mode values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.threat_intel_mode }
}
output "firewalls_virtual_hub" {
  description = "Map of virtual_hub values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.virtual_hub }
}
output "firewalls_zones" {
  description = "Map of zones values across all firewalls, keyed the same as var.firewalls"
  value       = { for k, v in azurerm_firewall.firewalls : k => v.zones }
}

