terraform {
backend "s3" {
bucket = "terraform-state-april-class-vitalie"
key = "jenkins/us-east-1/tools/vitalie/jenkins.tfstate"
region = "us-east-1"
// dynamo_table = "prod"
required_version = "0.11.14"
  }
}
