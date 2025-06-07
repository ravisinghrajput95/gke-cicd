gcloud container clusters create demo-cluster \
  --zone us-central1-a \
  --num-nodes 2

Create Artifact Registry (Docker Repository)
gcloud artifacts repositories create demo-repo \
  --repository-format=docker \
  --location=us-central1 \
  --description="Demo Docker Repo"

Enable Required APIs
gcloud services enable \
  container.googleapis.com \
  artifactregistry.googleapis.com \
  cloudbuild.googleapis.com \
  sourcerepo.googleapis.com
