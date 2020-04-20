variable "port_type" {
    description = "Service type to associate with port"
}
variable "image_port" {
    description = "Port number to open up"
}
variable "tags" {
    description = "Network tags to associate instances with"
    type = list(string)
}
variable "network" {
    description = "Network to associate firewall rule with"
}

variable "project_id" {}