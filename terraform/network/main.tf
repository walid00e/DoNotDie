resource "google_compute_network" "prod-vpc" {
  name                    = "prod-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public-subnet" {
  name          = "public-subnet"
  region        = "us-central1"
  network       = google_compute_network.prod-vpc.id
  ip_cidr_range = "192.168.1.0/24"
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = "private-subnet"
  region        = "us-central1"
  network       = google_compute_network.prod-vpc.id
  ip_cidr_range = "192.168.2.0/24"
}

resource "google_compute_router" "default" {
  name    = "default-router-us-central1"
  network = google_compute_network.prod-vpc.id
  region  = "us-central1"
}

resource "google_compute_router_nat" "default" {
  name                               = "default-router-nat-us-central1"
  router                             = google_compute_router.default.name
  region                             = google_compute_router.default.region
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "AUTO_ONLY"
  subnetwork {
    name                    = google_compute_subnetwork.private-subnet.id
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }
}

resource "google_compute_firewall" "default_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.prod-vpc.name
  allow {
    protocol = "tcp"
    ports    = [22]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "default_web" {
  name    = "allow-web"
  network = google_compute_network.prod-vpc.name
  allow {
    protocol = "tcp"
    ports    = [80, 443]
  }
  source_tags = ["web"]
}