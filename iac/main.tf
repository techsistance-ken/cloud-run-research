resource "google_project" "iac_test" {

    name = "IaC Testing"
    project_id = local.project_id

    folder_id = "folders/725721539193"
    billing_account = "01BB6E-724C5A-FD6D5E"

}

moved {
    from = google_project_service.project 
    to = google_project_service.project["artifactregistry.googleapis.com"]
}

resource "google_project_service" "project" {
  for_each = toset([
        "artifactregistry.googleapis.com",
        "run.googleapis.com"
  ])
  project = google_project.iac_test.project_id
  service = each.value
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = "us-central1"
  repository_id = "micro1"
  description   = "My Microservice Number 1"
  format        = "DOCKER"
  project = google_project.iac_test.project_id
}

resource "random_integer" "half_a" {
  min = 100000 
  max = 999999
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = "a"
  }
}

resource "random_integer" "half_b" {
  min = 100000 
  max = 999999
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = "z"
  }
}
locals {
    project_id = "iac-test-${random_integer.half_a.result}${random_integer.half_b.result}"
}
output "random" {
    value = local.project_id
}

# resource "google_cloud_run_v2_service" "default" {
#   name     = "cloudrun-service"
#   location = "us-central1"
#   ingress = "INGRESS_TRAFFIC_ALL"

#   template {
#     containers {
#       image = "us-docker.pkg.dev/cloudrun/container/hello"
#     }
#   }
# }