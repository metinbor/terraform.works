region = "us-east-1"

# Below code is used to set backend only
environment                     =   "vitalie"
s3_bucket                       =   "terraform-state-april-class-vitalie"
s3_folder_project               =   "kube"
s3_folder_region                =   "us-east-1"
s3_folder_type                  =   "tools"
s3_tfstate_file                 =   "eks.tfstate"

subnets = ["subnet-06d3786fe3010efd7",
             "subnet-07d812d6dcf1f4ad0",
              "subnet-0727edce804b3a944"]

  vpc_id = "vpc-08578af0c4f103e45"


instance_type ="t2.micro"


    asg_max_size = 5
 
tags = {

Env  = "Development"
Billing = "SMA"
Application = "Artemis" 
Region  = "us-east-1" 
Created_by = "Vitalie"
Team = "DevOps"
Manged_by   =   "Infrastructure"
Quarter = "3"
Name = "something"
}