
resource "google_compute_firewall" "deny_firewall_rule" {
  name    = "deny-${var.port_type}-${var.image_port}"
  project = var.project_id
  network = var.network
  deny {
    protocol = var.port_type
    ports = [
      var.image_port
    ]
  }
  source_ranges = var.source_ranges
  target_tags   = var.tags
}