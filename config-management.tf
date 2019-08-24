resource "null_resource" "installation_jenkins" {
  # depends_on = ["null_resource.installation_mariadb"]

  triggers = {
    ids = "${azurerm_virtual_machine.azure_jenkins_vm.id}"
  }

  connection {
    host        = "${azurerm_public_ip.azure_jenkins_public_ip.ip_address}"
    user        = "${var.vm_username}"
    private_key = "${tls_private_key.id_rsa.private_key_pem}"
  }

  provisioner "remote-exec" {
    script = "./scripts/installation-jenkins.sh"
  }

}
