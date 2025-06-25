data "google_container_engine_versions" "zone" {
  project  = "silent-presence-463914-s2"
  location = "us-central1-a"
}

data "google_container_engine_versions" "region" {
  project  = "silent-presence-463914-s2"
  location = "us-central1"
}

data "google_client_config" "default" {}