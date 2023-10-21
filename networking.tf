#-------------------------------------------
# DEFINE VPC VPC-PREPRODUCCION
#-------------------------------------------

module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "7.1.0"
  network_name = var.network_name
  project_id   = var.project_id
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name           = var.subnetwork_europe_west_name
      subnet_ip             = "10.240.0.0/16"
      subnet_region         = var.region_europe_west_name
      subnet_private_access = "true"
    }
  ]
}

resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = module.network.network_name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "esp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = module.network.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "http" {
  name    = "http-firewall-rule"
  network = module.network.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = [ "http-server" ]
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "https-firewall-rule"
  network = module.network.network_name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = [ "https-server" ]
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
}