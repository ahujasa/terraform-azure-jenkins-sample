data "azurerm_virtual_machine" "jenkins-vm" {
  name                = "azure-jenkins-vm"
  resource_group_name = "azure-jenkins-resource"
}

output "virtual_machine_id" {
  value = "${data.azurerm_virtual_machine.jenkins-vm.id}"
}
data "azurerm_public_ip" "jenkins-public-ip" {
  name                = "azure-jenkins-public-ip"
  resource_group_name = "${azurerm_resource_group.jenkins-resource-group.name}"
}

output "public_ip_address" {
  value = "${data.azurerm_public_ip.jenkins-public-ip.ip_address}"
}

output "jenkins-http-port" {
  value = "${local.port_http}"
}



