# Define variables
variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
  default     = "silent-presence-463914-s2"
}

variable "region" {
  description = "Region for the cluster (e.g., 'us-central1')"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "standard-gke-cluster"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
  default     = "default"
}

variable "ip_range_pods" {
  description = "Secondary IP range name for pods"
  type        = string
  default     = "us-central1-01-gke-01-pods"
}

variable "ip_range_services" {
  description = "Secondary IP range name for services"
  type        = string
  default     = "us-central1-01-gke-01-services"
}

variable "master_ipv4_cidr" {
  description = "CIDR block for private cluster master (e.g., '172.16.0.0/28')"
  type        = string
  default     = "172.16.0.0/28"
}