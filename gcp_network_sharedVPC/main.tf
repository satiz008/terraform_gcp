
resource "google_compute_network" "custom-vpc-tf" {
  name = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name = "public"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "10.1.0.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true
  
}

resource "google_compute_subnetwork" "private" {
  name = "private"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "10.0.0.0/24"
  region = "asia-southeast2"
  private_ip_google_access = true
  
}


resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["49.36.82.10/32"]
  priority = 455
}


