terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.85.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "searce-academy"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "keys.json"
}
