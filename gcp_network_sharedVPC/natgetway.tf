resource "google_compute_router" "router1" {
  name    = "private-router"
  region  = google_compute_subnetwork.private.region
  
  
  network = google_compute_network.custom-vpc-tf.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router" "router2" {
  name    = "public-router"
  region  = google_compute_subnetwork.public.region


  network = google_compute_network.custom-vpc-tf.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat-public" {
  name                               = "my-router-nat-public"
  router                             = google_compute_router.router1.name
  region                             = google_compute_router.router1.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_router_nat" "nat-private" {
  name                               = "my-router-nat-private"
  router                             = google_compute_router.router2.name
  region                             = google_compute_router.router2.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}