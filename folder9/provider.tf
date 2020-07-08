provider "azurerm" {
  version = "1.27"
}

// terraform {
//   required_version = "0.11.14"
// }


# These resources are to be created before running "terraform init" 

terraform { 
  required_version = "0.11.14"

  backend "azurerm" { 

    resource_group_name       = "dev" 

    storage_account_name      = "devitalie" 

    container_name            = "devcontainer" 

    access_key                = "I0BX9GqUXmE3Mp57DY1K8NBcL5QNO0nn4Kxe1vy6SosqB+di2atUCJuKoXx2iHO2OZyAYqnw6t9zJk5aeW+XzA==" 

    key                       = "dev_terraform.tfstate" 

  } 

}