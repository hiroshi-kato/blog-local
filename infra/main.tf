terraform {
  backend "gcs" {
    prefix = "tfstate/v1"
  }
}

## project ##
provider "google" {
  project = var.gcp_project_id
  region  = var.primary_region
}

locals {
  backend_app_name  = "blog-local-20220305-backend-app"
  frontend_app_name = "blog-local-20220305-frontend-app"
}

module "artifact-registry" {
  source                     = "./modules/artifact-registry"
  gcp_project_id             = var.gcp_project_id
  artifact_registry_location = var.primary_region
  backend_app_name           = local.backend_app_name
  frontend_app_name          = local.frontend_app_name

}
