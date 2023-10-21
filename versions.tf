terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.77.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.77.0"
    }
  }
}


provider "google-beta" {
  project     = var.project_id
  credentials = file("~/keys/terraform-demo.json")
}

provider "google" {
  project     = var.project_id
  credentials = file("~/keys/terraform-demo.json")
}


#-------------------------------------------
# TERRAFORM STATE IN CLOUD STORAGE
#-------------------------------------------

terraform {
  backend "gcs" {
    bucket      = "geometric-edge-395607"
    prefix      = "terraformm-gcp-simpliest/terraform/state"
    credentials = "~/keys/terraform-demo.json"
  }
}

