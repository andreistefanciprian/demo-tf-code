# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# terraform configuration
terraform {
  required_version = ">= 0.14.5"
  backend "gcs" {
  }
}

provider "google" {
  project = var.project
}

# gcp resources
resource "google_compute_firewall" "default" {
  name    = "${var.environment}-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "433"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "${var.environment}-network"
}

# variables
variable "project" {}
variable "environment" {}
