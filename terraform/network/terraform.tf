terraform {
  required_version = "1.15.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.41.0"
    }
  }
  backend "gcs" {
    bucket = "state-bucket-default-learning-gcp"
    prefix = "terraform/state/network"
  }
}