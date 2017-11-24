variable "zone_id" {
    description = "ID of the Route53 zone."
}

variable "domain_name" {
    description = "Domain name."
}

variable "mx_records" {
    description = "MX records for the domain."
    type = "list"
    default = [""]
}

variable "root_ip" {
    description = "IP to set as the root A record."
}