output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}

output "subnet1" {
  value = google_compute_subnetwork.public.id
}

output "subnet2" {
  value = google_compute_subnetwork.private.id
}

output "firewall" {
  value = google_compute_firewall.default.allow
}

output "route1" {
  value = google_compute_router.router1.name
}

output "route2" {
  value = google_compute_router.router2.name
}