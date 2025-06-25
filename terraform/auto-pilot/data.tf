data "google_client_config" "default" {}

data "google_container_engine_versions" "region" {
  location = var.region
  project  = var.project_id
}