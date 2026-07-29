source "googlecompute" "default" {
  project_id          = var.project_id
  source_image_family = "server-golden"
  zone                = "us-central1-a"
  ssh_username        = "packer"
  image_name          = "app-v${var.image_version_safe}"
  image_description   = "Golden image built from release version ${var.image_version_raw}"
  network             = "prod-vpc"
  subnetwork          = "private-subnet"
  use_internal_ip     = false
  image_labels = {
    git_commit = var.git_sha
    version    = var.image_version_safe
  }
}