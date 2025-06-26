# GKE Standard Cluster using Terraform Module
module "gke_standard" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "36.3.0"

  project_id        = var.project_id
  name              = var.cluster_name
  region            = var.region
  zones             = ["${var.region}-a", "${var.region}-b", "${var.region}-c"] # Regional cluster
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services


  # Networking: VPC-native and Network Policies
  http_load_balancing        = true
  network_policy             = true
  horizontal_pod_autoscaling = true

  # Security: Binary Authorization
  enable_binary_authorization = true

  # Release Channel and Maintenance
  release_channel = "RAPID"

  maintenance_start_time = "2025-06-01T00:00:00Z"
  maintenance_end_time   = "2025-06-01T04:00:00Z"
  maintenance_recurrence = "FREQ=DAILY"

  # Node Pools
  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "e2-medium"
      min_count          = 1
      max_count          = 3
      disk_size_gb       = 100
      auto_repair        = true
      auto_upgrade       = true
      enable_secure_boot = true
    },
    {
      name               = "preemptible-node-pool"
      machine_type       = "e2-medium"
      min_count          = 0
      max_count          = 5
      disk_size_gb       = 100
      preemptible        = true
      auto_repair        = true
      auto_upgrade       = true
      enable_secure_boot = true
    }
  ]

  # Node Pool Labels and Taints
  node_pools_labels = {
    "default-node-pool" = {
      workload = "general"
    }
    "preemptible-node-pool" = {
      workload = "cost-optimized"
    }
  }
}