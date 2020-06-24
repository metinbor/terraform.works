region    =      "ap-northeast-1"

# Below code is used to set backend only
environment                     =   "tokyo"
s3_bucket                       =   "terraform-state-april-class-vitalie"
s3_folder_project               =   "jenkins"
s3_folder_region                =   "us-east-1"
s3_folder_type                  =   "tools"
s3_tfstate_file                 =   "jenkins.tfstate"


#Depends on network team
cidr_block =     "10.0.0.0/16"
public_cidr_block1 = "10.0.101.0/24"
public_cidr_block2 = "10.0.102.0/24"
public_cidr_block3 = "10.0.103.0/24"
private_cidr_block1 = "10.0.1.0/24"
private_cidr_block2 = "10.0.2.0/24"
private_cidr_block3 = "10.0.3.0/24"

image_value = "amzn2-ami-hvm-2.0.20200406.0-x86_64-ebs*"
owner_name = "amazon"
instance_type = "t2.micro"
ami = "ami-0323c3dd2da7fb37d"


az1 = "a"
az2 = "b"
az3 = "c"


java_version            = "-1.8.0-openjdk-devel"
jenkins_version         = "jenkins"

key_name = "tokio-key"
user = "ec2-user"



cidr_block = "10.0.0.0/16"
public_cidr_block1 = "10.0.101.0/24"
public_cidr_block2 = "10.0.102.0/24"
public_cidr_block3 = "10.0.103.0/24"




private_cidr_block1 = "10.0.1.0/24"
private_cidr_block2 = "10.0.2.0/24"
private_cidr_block3 = "10.0.3.0/24"
