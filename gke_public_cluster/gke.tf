# GKE cluster
resource "google_container_cluster" "primary" {
  provider = google-beta
  name     = var.cluster_name
  location = var.zone


  # remove_default_node_pool = true
  min_master_version = var.cluster_version ### Latest stable master and node versions
  release_channel {
    channel = var.release_channel
  }

  enable_shielded_nodes       = var.shielded_nodes              ### Shielded GKE nodes
  enable_binary_authorization = var.binary_authorization
  datapath_provider           = var.datapath_provider  ####Dataplane v2 Enable
  
  addons_config {                                   #### NodeLocal DNS cache
    dns_cache_config {
      enabled = var.dns_cache_config
    }
    http_load_balancing { ### HTTP loadbalancing Enable
      disabled = var.loadbalancing_disable
    }
  }

  workload_identity_config { #### Workload identiy
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  logging_config { ### cloud logging eanbeld
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]

  }


  monitoring_config { ### cloud monitoring eanbeld
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]

    #### Promethes bolck removed
  }

  maintenance_policy {
    recurring_window {
      end_time   =  var.maintenance_end_time                           
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
      start_time =  var.maintenance_start_time                          
    }
  }
  vertical_pod_autoscaling {
    enabled = var.pod_vertical_scale
  }


  node_pool {
    name               = var.default_nodepool_name
    initial_node_count = var.default_gke_num_nodes
    management {
      auto_repair  = var.auto_upgrade
      auto_upgrade = var.auto_repair
    }

    upgrade_settings { ### Set Max surge/Max unavailable
      max_surge       = var.max_surge
      max_unavailable = var.max_unavailable
    }


    node_config {
      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/cloud-platform",
      ]

      service_account = var.service_account


           labels = {
        component       = var.component
        cost-center     = var.cost-center
        environment     = var.environment
        primary-contact = var.primary-contact
      }


      metadata = {
        "disable-legacy-endpoints" =  var.legacy_endpoints
      }

      # preemptible  = true
      machine_type = var.deafult_machine_type
      disk_type    = var.disk_type
      disk_size_gb = var.disk_size_gb
      image_type   = var.image_type



      tags = ["gke-node", "${var.project_id}-gke"]

      kubelet_config {
        cpu_manager_policy = "static"

      }

      shielded_instance_config {
        enable_secure_boot          = var.secure_boot 
        enable_integrity_monitoring = var.integrity_monitoring   ## integrity_monitoring Enabled

      }


    }
  }

  network    = var.vpc_name
  subnetwork = var.subnet_name


  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ranges"
    services_secondary_range_name = "services-range"
  }


}