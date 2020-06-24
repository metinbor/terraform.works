variable "region" {} 
#variable "key_name" {}
# -- depends on the network team
variable "cidr_block" {}
variable "public_cidr_block1" {} 
variable "public_cidr_block2" {}
variable "public_cidr_block3" {} 

variable "private_cidr_block1" {}
variable "private_cidr_block2" {}
variable "private_cidr_block3" {}




# -- user will be asked to indicate the region. 
    #default = "us-east-1" # -- if you don't specify the region the system will create  the default one. 
