provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

resource "google_container_cluster" "t2s_gke" {
  name     = "t2s-gke-cluster"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "default"
  subnetwork = "default"

  workload_identity_config {
    identity_namespace = "your-gcp-project-id.svc.id.goog"
  }
}

resource "google_container_node_pool" "default" {
  name       = "default"
  cluster    = google_container_cluster.t2s_gke.name
  location   = google_container_cluster.t2s_gke.location
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
