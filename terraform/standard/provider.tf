# Configure Google provider
provider "google" {
  project = var.project_id
  #credentials = file("terraform-sa-key.json")
  region  = var.region
}