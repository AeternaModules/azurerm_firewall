output "firewalls" {
  description = "All firewall resources"
  value       = azurerm_firewall.firewalls
}
output "firewalls_dns_proxy_enabled" {
  description = "List of dns_proxy_enabled values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.dns_proxy_enabled]
}
output "firewalls_dns_servers" {
  description = "List of dns_servers values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.dns_servers]
}
output "firewalls_firewall_policy_id" {
  description = "List of firewall_policy_id values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.firewall_policy_id]
}
output "firewalls_ip_configuration" {
  description = "List of ip_configuration values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.ip_configuration]
}
output "firewalls_location" {
  description = "List of location values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.location]
}
output "firewalls_management_ip_configuration" {
  description = "List of management_ip_configuration values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.management_ip_configuration]
}
output "firewalls_name" {
  description = "List of name values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.name]
}
output "firewalls_private_ip_ranges" {
  description = "List of private_ip_ranges values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.private_ip_ranges]
}
output "firewalls_resource_group_name" {
  description = "List of resource_group_name values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.resource_group_name]
}
output "firewalls_sku_name" {
  description = "List of sku_name values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.sku_name]
}
output "firewalls_sku_tier" {
  description = "List of sku_tier values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.sku_tier]
}
output "firewalls_tags" {
  description = "List of tags values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.tags]
}
output "firewalls_threat_intel_mode" {
  description = "List of threat_intel_mode values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.threat_intel_mode]
}
output "firewalls_virtual_hub" {
  description = "List of virtual_hub values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.virtual_hub]
}
output "firewalls_zones" {
  description = "List of zones values across all firewalls"
  value       = [for k, v in azurerm_firewall.firewalls : v.zones]
}

