provider "google" {
  credentials = file("prod-default.json")
  project     = "prod-default"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-a"
}

resource "google_cloud_run_service" "kefir" {
  name     = "kefir-srv"
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "gcr.io/prod-default/kefir"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
