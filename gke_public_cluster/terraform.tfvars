project_id            = "PROJECT_ID"     ### ProjectID
cluster_name          = "scylladb-chronicle-s"
cluster_version       = "1.22.8-gke.202"
default_nodepool_name = "scylladb-generic"
primary_nodepool_name = "scylla-nodes"
vpc_name              = "chronicle-s-net"
subnet_name           = "chronicle-s-net-subnet"
zone                  = "europe-west1-b"
region                = "europe-west1"
deafult_machine_type  = "n1-standard-8"
scylla_machine_type   = "n2-highmem-4"
default_gke_num_nodes = "2"
primary_gke_num_nodes = "3"
disk_type             = "pd-ssd"
disk_size_gb          = "100"
image_type            = "UBUNTU_CONTAINERD"
service_account       = "SERVICE_ACCOUNT"        ### SERVICE ACCOUNT
release_channel       = "STABLE"
dns_cache_config = true
auto_repair = true
auto_upgrade = true
pod_vertical_scale = false
loadbalancing_disable = false
legacy_endpoints = true
secure_boot = true
integrity_monitoring = true
maintenance_start_time = "2022-07-11T21:30:00Z"
maintenance_end_time = "2022-07-12T21:30:00Z"
max_surge = 1
max_unavailable = 0
binary_authorization = true
shielded_nodes = true
datapath_provider = "ADVANCED_DATAPATH"




##### Labels

component       = "scylladb"
cost-center     = "scylladb"
environment     = "staging"
primary-contact = "devopsattherategwi.com"
