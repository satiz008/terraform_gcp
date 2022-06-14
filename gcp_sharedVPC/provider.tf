terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.85.0"
    }
  }
}


provider "google" {
  # Configuration options
  project = "ki-poc-hp-01"
  region = "asia-southeast1"
  zone = "asia-southeast1-a"
  
}











