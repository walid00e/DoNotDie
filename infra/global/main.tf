resource "google_storage_bucket" "default" {
  name     = var.state_bucket_name
  location = var.state_bucket_location
  lifecycle {
    prevent_destroy = true
  }
}