source "googlecompute" "default" {
  project_id             = var.project_id
  source_image_family = "debian-11"
  zone                = "us-central1-a"
  ssh_username        = "packer"
  image_name          = "golden-image-{{timestamp}}"
  network             = "prod-vpc"
  subnetwork          = "private-subnet"
  use_internal_ip     = false
}