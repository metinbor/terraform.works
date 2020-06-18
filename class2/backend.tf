terraform {
  required_version = "0.11.14"
  backend "s3" {
  bucket = "terraform-state-april-class-vitalie"
  key = "path/to/my/key"
  region = "us-east-1"
  }
}