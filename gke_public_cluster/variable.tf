variable "cluster_name" {
  description = "GKE cluster name"
  type = string
}

variable "cluster_version" {
  description = "GKE Cluster and node version"
  type = string
}

variable "default_nodepool_name" {
  description = "default_nodepool_name"
  type = string
}

variable "primary_nodepool_name" {
  description = "primary_nodepool_name"
  type = string
}

variable "default_gke_num_nodes" {
  description = "number of gke nodes"
  type = number
}

variable "primary_gke_num_nodes" {
  description = "number of gke nodes"
  type = number
}

variable "vpc_name" {
  description = "VPC name"
  type = string
}

variable "subnet_name" {
  description = "Subnet name"
  type = string
}

variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "scylla_machine_type" {
  description = "Google VM Instance type."
  type        = string
}

variable "deafult_machine_type" {
  description = "Google VM Instance type."
  type        = string
}

variable "disk_type" {
  description = "Google VM Instance Disk type."
  type = string
}

variable "disk_size_gb" {
  description = "VM Disk Size"
  type = number
}

variable "image_type" {
  description = "VM Image type"
  type = string
}

variable "zone" {
  description = "zone"
  type = string
}

variable "service_account" {
  description = "Service acccount"
  type = string
}

variable "release_channel" {
  description = "channel value"
  type = string
  
}

variable "secure_boot" {
  description = "enableing secure boot"
  type = bool
  
}

variable "integrity_monitoring" {
   description = "enabling integrated monitoring"
   type =  bool  
}

variable "dns_cache_config" {
  description = "enabling-DNS-cache-config"
  type = bool
  
}


variable "auto_repair" {
  description = "Node-auto-repair"
  type = bool

  
}

variable "auto_upgrade" {
  description = "node-auto-upgrades"
  type = bool
}



variable "pod_vertical_scale" {
   description = "enable vertical scaling of pods"
   type = bool
     
}
variable "maintenance_start_time" {
  description = "maintence start timing"
  type = string
  
}


variable "maintenance_end_time" {
  description = "maintence end time"
  type = string
}


variable "loadbalancing_disable" {
  description = "disabling-https-loadbalancing"
  type = bool
  
}

variable "legacy_endpoints" {
  description = "disable legacy endpoints"
  type = bool
  
}
variable "max_surge" {
  type = number
}
variable "max_unavailable" {

  type = number
  
}

variable "shielded_nodes" {
  
}

variable "binary_authorization" {
  
}

variable "datapath_provider" {
  
}

####### Labels

variable "component" {
}

variable "cost-center" {
}

variable "environment" {
}

variable "primary-contact" {
}