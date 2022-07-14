# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" { ### Primary nodepool           
  name       = var.primary_nodepool_name
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.primary_gke_num_nodes


  management {
    auto_repair  = true
    auto_upgrade = true
  }

  upgrade_settings {
    max_surge       = "1"
    max_unavailable = "0"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    service_account = var.service_account


    labels = {
      component       = var.component
      cost-center     = var.cost-center
      environment     = var.environment
      primary-contact = var.primary-contact
    }



    metadata = {
      "disable-legacy-endpoints" = "true"
    }

    # preemptible  = true

    machine_type = var.scylla_machine_type
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb
    image_type   = var.image_type


    taint {
      key    = "role"
      value  = "scylla-clusters"
      effect = "NO_SCHEDULE"
    }
    tags = ["gke-node", "${var.project_id}-gke"]

    shielded_instance_config {
      enable_secure_boot          = true ### Secure Boots
      enable_integrity_monitoring = true ## integrity_monitoring Enabled

    }



  }
}