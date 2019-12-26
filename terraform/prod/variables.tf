variable project {
  description = "Project ID"
  default = "devops-1-262914"
}
variable region {
  description = "Region"
  default = "europe-west1"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
  default = "~/.ssh/appuser.pub"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
  default = "~/.ssh/appuser"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}