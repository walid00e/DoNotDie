output "prod_vpc_id" {
  description = "the id of the prod vpc"
  value       = google_compute_network.prod-vpc.id
}