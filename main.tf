variable "credentials" {}

provider "google" {
  credentials = file(var.credentials)

  project = "gcp-automated-networks-265320"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}