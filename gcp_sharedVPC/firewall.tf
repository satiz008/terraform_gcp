resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.custom-vpc-tf.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22"]
  }

  source_tags = ["web"]
}

