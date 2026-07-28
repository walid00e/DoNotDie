source "googlecompute" "default" {
  project_id             = var.project_id
  source_image_family = "server-golden"
  zone                = "us-central1-a"
  ssh_username        = "packer"
  image_name          = "golden-image-{{image_version}}"
  network             = "prod-vpc"
  subnetwork          = "private-subnet"
  use_internal_ip     = false
}