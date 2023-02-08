provider "google" {
  credentials = file("botit.json")

  project = "botit-377021"
  region  = "us-central1"
}