# Configure the AWS Provider
provider "aws" {
  version = "~> 2.66"
  region  = "us-east-1"
}

#terraform { - we cannot have 2 terraform and due to the next code will move down the requiremen
  #required_version = "0.11.14"
#}

#}