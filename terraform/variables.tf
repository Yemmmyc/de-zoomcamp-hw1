variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "GCP bucket name"
  type        = string
}

variable "dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
}
