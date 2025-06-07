# GKE CI/CD Demo with GitHub, Cloud Build & Kubernetes

This is a sample Python Flask application deployed to **Google Kubernetes Engine (GKE)** using **Cloud Build** as the CI/CD pipeline and **GitHub** as the source code repository.

> Containerized with Docker  
> Built and deployed via Cloud Build  
> Hosted on GKE  
> GitHub-triggered CI/CD pipeline

## How the Pipeline Works

1. Developer pushes code to **GitHub**.
2. **Cloud Build** is triggered via a GitHub push.
3. The pipeline:
   - Builds a Docker image.
   - Pushes the image to **Container Registry**.
   - Applies K8s configs to redeploy the app to **GKE**.
4. The updated app becomes available via a public LoadBalancer IP.

## Prerequisites

- Google Cloud Project with billing enabled
- GKE Cluster created
- Cloud Build API enabled
- IAM permissions:
  - Cloud Build → GKE Deployer
  - Cloud Build → Container Registry Push
- GitHub Repo with Cloud Build Trigger configured

##  Deploy Steps

1. Clone this repo and push it to your own GitHub account.
2. In Google Cloud Console:
   - Create a Cloud Build trigger with your GitHub repo.
   - Use `cloudbuild.yaml` as your build config.
3. Push to GitHub to trigger a build and deployment.
4. Fetch the LoadBalancer IP:
   ```bash
   kubectl get svc flask-service
