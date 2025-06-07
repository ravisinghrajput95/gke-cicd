module "gke_autopilot" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
  version = "~> 32.0"

  project_id        = var.project_id
  name              = var.cluster_name
  region            = var.region
  zones             = ["${var.region}-a", "${var.region}-b", "${var.region}-c"] # Regional cluster
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services

  # Private Cluster
  enable_private_nodes   = true
  master_ipv4_cidr_block = var.master_ipv4_cidr

  # Networking: VPC-native
  http_load_balancing        = true
  horizontal_pod_autoscaling = true

  # Security: Binary Authorization
  enable_binary_authorization = true

  # Release Channel
  release_channel = "RAPID"

  # Maintenance Window
  maintenance_start_time = "2025-06-01T00:00:00Z"
  maintenance_end_time   = "2025-10-01T04:00:00Z"
  maintenance_recurrence = "FREQ=WEEKLY"
}