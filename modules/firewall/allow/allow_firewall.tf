resource "google_compute_firewall" "allow_firewall_rule" {
  name    = "allow-${var.port_type}-${var.image_port}"
  project = var.project_id
  network = var.network
  allow {
    protocol = var.port_type
    ports = [
      var.image_port
    ]
  }
  source_ranges = var.source_ranges
  target_tags   = var.tags
}