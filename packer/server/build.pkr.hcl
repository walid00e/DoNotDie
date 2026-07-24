build {
  sources = [
    "sources.googlecompute.default"
  ]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y ansible"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "../../ansible/playbooks/setup.yml"
  }
}