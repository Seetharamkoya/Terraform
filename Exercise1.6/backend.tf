terraform {
  backend "s3" {
    bucket = "terra7799"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}