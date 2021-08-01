
provider "google" {
  project = var.project
}

terraform {
  required_version = ">= 0.14.5"
  backend "gcs" {
  }
}

resource "google_compute_address" "static" {
  name = "ipv4-address-${var.environment}"
}

variable "project" {}
variable "environment" {}