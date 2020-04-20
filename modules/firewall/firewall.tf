locals {
  google_load_balancer_ip_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16",
  ]
}

resource "google_compute_firewall" "firewall_rule" {
  name    = "allow-${var.port_type}-${var.image_port}"
  project = var.project_id
  network = var.network
  allow {
    protocol = var.port_type
    ports = [
      var.image_port
    ]
  }
  source_ranges = local.google_load_balancer_ip_ranges
  target_tags   = var.tags
}