terraform {
  backend "gcs" {
    bucket = "terraforms-state"
    prefix = "terraform/state"
  }
}