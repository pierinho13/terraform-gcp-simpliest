data "google_service_account" "terraform_demos" {
  account_id = "terraform-demos"
}


resource "google_compute_instance" "nginx" {
  name         = "nginx"
  machine_type = "e2-micro"
  zone         = "europe-west1-c"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "debian-12-bookworm-v20230711"
      size  = 10
    }
  }

  network_interface {
    network    = module.network.network_name
    subnetwork = module.network.subnets_names[0]
    access_config { //public ip

    }
  }


  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = data.google_service_account.terraform_demos.email
    scopes = ["cloud-platform"]
  }

}