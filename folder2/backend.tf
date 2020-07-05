terraform {
backend "s3" {
bucket = "terraform-state-april-class-vitalie"
key = "jenkins/us-east-1/tools/vitalie/jenkins.tfstate"
region = "us-east-1"
  }
}
