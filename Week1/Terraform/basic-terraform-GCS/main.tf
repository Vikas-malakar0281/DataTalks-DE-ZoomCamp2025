terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.11.0"
    }
  }
}

provider "google" {
  project = "vihannbot"
  region  = "asia-south1"
}

resource "google_storage_bucket" "terra-bucket" {
  name          = "terra-bucket"
  location      = "asia-south1"
  force_destroy = true
  
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
