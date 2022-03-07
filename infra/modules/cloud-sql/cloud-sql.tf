variable "target_region" {
  description = "デプロイするリージョン"
  type        = string
  default     = "us-central1"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database
resource "google_sql_database_instance" "blog-local-20220305-db" {
  name                = "blog-local-20220305-db"
  database_version    = "POSTGRES_14"
  region              = var.target_region
  deletion_protection = false

  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"
    disk_size         = "20"
    disk_type         = "PD_SSD"

    ip_configuration {
      ipv4_enabled = true
    }
  }
}

resource "google_sql_database" "blog-local-20220305-db" {
  name     = "blog_local_20220305_db"
  instance = google_sql_database_instance.blog-local-20220305-db.name
}

output "blog_local_db_connection_name" {
  value = google_sql_database_instance.blog-local-20220305-db.connection_name
}
