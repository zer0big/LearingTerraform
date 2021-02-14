output "webapp_url" {
    value = azurerm_app_service.zerodemo.default_site_hostname 
}

output "webapp_ip" {
    value = azurerm_app_service.zerodemo.outbound_ip_address_list 
}