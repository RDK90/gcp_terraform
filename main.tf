module "http_firewall_rule" {
    source = "./modules/firewall/health_check"
    project_id = var.project_id
    port_type = "tcp"
    image_port = "80"
    tags = ["http-server"]
    network = module.vpc.name
}

module "vpc" {
    source = "./modules/network"
    network = "test-vpc"
}