module "http_firewall_rule" {
    source = "./modules/firewall"
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