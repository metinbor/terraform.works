
private_subnet1_range    = "10.0.1.0/24" 

private_subnet2_range    = "10.0.2.0/24" 

private_subnet3_range    = "10.0.3.0/24" 

resource_group_name      = "dev"           #Precreate this while creating Backend Container 

security_group_name      = "sec_group1" 

vm1_computername         = "vm1" 

vm2_computername         = "vm2" 

vm3_computername         = "vm3" 

address_space            = "10.0.0.0/16" 

vnet_name                = "vnet1" 

location                 = "eastus" 

ssh_key                  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ZPzvs00h6qqQ7ry9Mqe1hyjujwLu0azWLLVMRTMNQC2Z/lME58uwLISkxqLmBtUEzCAaLWT4+J5IukOMTtnOR+vvRVF9kurTED+X5LozF3bJbQahPTEVeikh6px4eCzUyaMFkFZatRMShmTfiftUSy38TWkfza5Cpp37pRDhbqtRuU2VcBHnUSlXv4IFbaCcxPHr9TAdeMF9hLrlEBZaJkF80WCZfMTFrp1JDKeti9qwpvifydY87bYNdPqoFCNAXvM+MILu+yjNXjkVSry7SOT8gMI9ctgPsmweqIEy7BTqKNq5RQUQgmZJekxZQB5Yh4EpRdlSbiBLyvdOVgnD" 

environment              = "dev" 

storage_account          = "devitalie" 

 

 

#OS Information 

publisher                = "OpenLogic" 

offer                    = "CentOS" 

sku                      = "7.5" 

version                  = "latest" 

admin_username           = "centos" 

vm_size                  = "Standard_DS1_v2" 

 