// # Configure the AWS Provider
 provider "aws" {
  version = "~> 2.66"
  region  = "${var.region}" # -- user will provider the region, and you will need to create another file where to find the variable. 
}

// #terraform { -- this portion of the file need to be separated from provider.tf and is moved to backend.tf


// #required_version = "0.11.14"
// #backend "s3" {
// #bucket = "terraform-state-april-class-vitalie"
// #key = "path/to/my/key"
// #region = "us-east-1"


// #}
// #}
// #terraform { - we cannot have 2 terraform and due to the next code will move down the requiremen
// #required_version = "0.11.14"
// #}


// #}

