packer {
  required_version = "1.15.4"
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "1.2.7"
    }
    ansible = {
      version = "1.1.6"
      source  = "github.com/hashicorp/ansible"
    }

  }
}