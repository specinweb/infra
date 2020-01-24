resource "google_compute_firewall" "firewall_ssh" {
  name = "default-allow-ssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
  source_ranges = "${var.source_ranges}"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "reddit-app"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292", "80"]
  }
  source_ranges = "${var.source_ranges}"
  target_tags   = ["reddit-app"]
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "reddit-db"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}