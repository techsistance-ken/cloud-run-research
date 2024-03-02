data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../iac/terraform.tfstate"
  }
}

locals {
    project_id = data.terraform_remote_state.vpc.outputs.random
}       

output "remote_state" {
    value = local.project_id
}


resource "google_cloud_run_v2_service" "default" {
  name     = "micro1"
  location = "us-central1"
  ingress = "INGRESS_TRAFFIC_ALL"
  project = local.project_id

  template {
    containers {
      image = "us-central1-docker.pkg.dev/iac-test-472890332835/micro1/iac-test:0.0.0"
    }
  }
}