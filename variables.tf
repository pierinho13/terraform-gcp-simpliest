variable "project_id" {
  description = "ID del proyecto de Google Cloud"
  default     = "geometric-edge-395607"
}

variable "network_name" {
  description = "network name"
  default     = "vpc-test-demo"
}

variable "subnetwork_europe_west_name" {
  description = "subnetwork default"
  default     = "subnet-europe-west1"
}
variable "region_europe_west_name" {
  description = "region default"
  default     = "europe-west1"
}

variable "zone_europe_west_name" {
  description = "zone default"
  default     = "europe-west1-c"
}