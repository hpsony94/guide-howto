resource "google_service_account" "default" {
  account_id   = "demo-gce-sa"
  display_name = "Service Account for Terraform Demo"
}

resource "google_compute_instance" "default" {
  name         = "tf-instance-demo"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "apt-get update -y && apt-get install -y nginx"

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
