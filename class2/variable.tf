variable "region" {} 
variable "key_name" {}
#variable "user" {}
# -- depends on the network team
variable "image_value" {}
variable "instance_type" {}
variable "owner_name" {}
variable "cidr_block" {}
variable "public_cidr_block1" {} 
variable "public_cidr_block2" {}
variable "public_cidr_block3" {} 

variable "private_cidr_block1" {}
variable "private_cidr_block2" {}
variable "private_cidr_block3" {}

variable "java_version" {}
variable "jenkins_version" {}

variable "az1" {}
variable "az2" {}
variable "az3" {}

variable "user" {}

# variable "a" {}
# variable "b" {}
# variable "c" {}



# -- user will be asked to indicate the region. 
    #default = "us-east-1" # -- if you don't specify the region the system will create  the default one. 
