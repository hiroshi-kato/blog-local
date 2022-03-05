variable "gcp_project_id" {}
variable "backend_app_name" {}
variable "frontend_app_name" {}

variable "artifact_registry_location" {
  type        = string
  description = "Artifact Registry のロケーションをどこにするか"
}

resource "google_artifact_registry_repository" "blog-local-20220305-backend-app" {
  provider = google-beta

  project       = var.gcp_project_id
  location      = var.artifact_registry_location
  repository_id = var.backend_app_name
  description   = "バックエンドアプリケーション"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "blog-local-20220305-frontend-app" {
  provider = google-beta

  project       = var.gcp_project_id
  location      = var.artifact_registry_location
  repository_id = var.frontend_app_name
  description   = "フロントエンドアプリケーション"
  format        = "DOCKER"
}
