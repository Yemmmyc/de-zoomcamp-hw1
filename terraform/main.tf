provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "data_bucket" {
  name     = var.bucket_name
  location = var.region
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
  location   = var.region
}
