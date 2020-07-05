<<<<<<< HEAD
<<<<<<< HEAD
# Terraform Jenkis


### Description

Scope of the project is to  create the VPC in AWS and install Jenkis using Terraform. Code should work in every region of AWS. 

### VPC requirements 
> 6 subnets

> 3 private subnets

> 3 public subnets
 

* Public subnets should have IGW attached to it in order to have access to the internet. 
 
* Configure route tables properly. 
* Once private and public subnet created, please create ec2 instance (manually)  on public subnet and ping google.com. If everything is successful, you should have proper response

* Moving forward, on that VPC you just provisioned, please create ec2 intance to install Jenkins:
  - Jenkins has to be installed using terraform provisioner.
  - One command should create VPC with the components, and build jenkins on top of it.
  -  Once the Jenkins up and running, please print out the username password as an output

Please read the instructions and requirements of the instance needed for Jenkins. 

Since this project has two components we will split the presentation in two: First it will be the creation and components of the VPC. Second will be Jenkis instalation.  

# VPC
> Virtual Private Cloud in AWS [link](https://aws.amazon.com/vpc/)

Components of the VPC:

* Private and Public Subnets    
    - The configuration for this scenario includes a VPC with a public and private subnets. We recommend this scenario if you want to run a public-facing web application, while maintaining back-end servers that aren't publicly accessible.
    - We will use 3 private subnets and 3 public subnets. Our EC2 instance for Jenkis will be attached to a public subnets in order to have internet connections. 

* Internet Gateway [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)

    - Internet gateway is a horizontally scaled, redundant, and highly available VPC component that allow communications between VPC and Internet. 
    - Internet Gateway should be attached to VPC. 
    - Add a route to your subnet's route that directs internet-bound traffic to the internet gateway. If a subnet is associated with a route table that has a route to an internet gateway, it's know as a public subnet. If a subent is associated with a route table that does not have a route to an internet gateway, it's know as a private subnet. 
* Route Table [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
    - route table contains a set of rules, called route, that are used to determine where network traffic from your subnet or gateway is directed. 
    - each subnet in your VPC must be associated with a route table. 

* Security Group AWS [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

    - security group acts as a virtual firewall for your instance to control inbound and outbound traffic. 
    - when you launch an instance in a VPC, you can assign up to five security groups to the instance.
    - security groups act at the instance level, not the subnet level. 
    - each instance in a subnet in your VPC can be assigned to a different set of security groups. 
    - by default a security group is dening all traffic, we need to specify which ports we want to use. 

* Key Pair [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

    - amazon ec2 uses public key cryptography to encrypt and decrypt login information. 
    - public key cryptography uses a public key to encrypt a piece of data, and then the recipiend uses the private key to decrypt the data. 
    - the public and private keys are know as a key pair.
    - public key cryptography enables you to securely access your instance using a private a key instead of a password. 

* Availability Zones [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)

    - availability zone is one or more discrete data center with redundant power networking, and connectivity is an AWS Region. 
    - availability zones allow you to operate production applications and databases that are more highly available, fault tolerant, and scalable than would be possible from a single data center. 
    - each region has a different number of availability zones, at least two is the minimum. 

* Amazon Elastic Compute Cloud (EC2) [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

    - Amazon EC2 provides scalable computing capacity in the AWS cloud
    - virtual computing environments, known as instances. 


    # Jenkins

> Automation Tool [link](https://www.jenkins.io/doc/)

* Jenkis is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software. 
    

# Deliver Infrastucture as code 

> Terraform 


* Write declarative configuration files. 

    - collaborate and share configurations
    - evolve and version your infrastructure 
    - automate provisioning 

* Plan and predict changes

    - clearly mapped resources dependencies 
    - separation of plan and apply
    - consistent, repeatable workflow. 

* Create reproducible infrastructure

    - reproducible production, staging, and development environments
    - shared modules for common infrastructure patterns
    - combine multiple providers consistently

# Terraform Structure.


 * [backend.tf](https://www.terraform.io/docs/backends/index.html)
    - backends determine where state is tored. 

 * [igw.tf](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)
    
    - provided resources to create a VPC Internet Gateway

 * [instance.tf](https://www.terraform.io/docs/providers/aws/r/instance.html)
    
    - provides an EC2 instance resources

 * [key_pair.tf](https://www.terraform.io/docs/providers/aws/r/key_pair.html)

    - key_pair deployer

 * [networking.tf](https://www.terraform.io/docs/providers/type/network-index.html)

    - networking resources provided in this file 

 * [null_resource.tf](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource)

    - resources that implements the standar lifecycle. 
    - Jenkis password will be displayd at the end. 
    - all atributes for Jenkis installation called remote-exec provisioner. 

 * [private_subnet.tf](https://www.terraform.io/docs/providers/aws/r/subnet.html)

    - resources for private subnets

 * [provider.tf](https://www.terraform.io/docs/providers/index.html)

    - provider is responsible for understanding API interactions and exposing resources. 

 * [public_subnet.tf] (https://www.terraform.io/docs/providers/aws/r/subnet.html)
    
        - resources for public subnets. 

 * [securitygroupaws.tf](https://www.terraform.io/docs/providers/aws/r/security_group.html)

        - resources for security groups. 

 * [setenv.sh](https://www.terraform.io/docs/commands/environment-variables.html)

        - resources for set environmental variables

 * [variable.tf](https://www.terraform.io/docs/configuration/variables.html)

        - variables set-up

 * [vpc.tf](https://www.terraform.io/docs/providers/aws/r/vpc.html)

    - VPC resources

    /configurations/regions


    * [.tfvarsfiles](https://www.terraform.io/docs/configuration/variables.html)

        - variable definitions files, each regions has .tfvars files.               

    * bahrain.tfvars
    * canada.tfvars
    * frankfurt.tfvars
    * hong_kong.tfvars
    * ireland.tfvars
    * london.tfvars
    * milan.tfvars
    * mumbai.tfvars
    * ohio.tfvars
    * oregon.tfvars
    * paris.tfvars
    * sao_paulo.tfvars
    * seoul.tfvars
    * singapore.tfvars
    * stockholm.tfvars
    * sydney.tfvars
    * tokyo.tfvars
    * virginia.tfvars
=======
# Install Jenkis with Terraform
=======
>>>>>>> 5dab2beba1be46808171d0b20c16e70c34b14be3


### Description

Scope of the project is to  create the VPC in AWS and install Jenkis using Terraform. Code should work in every region of AWS. 

### VPC requirements 
> 6 subnets

> 3 private subnets

> 3 public subnets
 

* Public subnets should have IGW attached to it in order to have access to the internet. 
 
* Configure route tables properly. 
* Once private and public subnet created, please create ec2 instance (manually)  on public subnet and ping google.com. If everything is successful, you should have proper response

* Moving forward, on that VPC you just provisioned, please create ec2 intance to install Jenkins:
  - Jenkins has to be installed using terraform provisioner.
  - One command should create VPC with the components, and build jenkins on top of it.
  -  Once the Jenkins up and running, please print out the username password as an output

Please read the instructions and requirements of the instance needed for Jenkins. 

Since this project has two components we will split the presentation in two: First it will be the creation and components of the VPC. Second will be Jenkis instalation.  

# VPC
> Virtual Private Cloud in AWS [link](https://aws.amazon.com/vpc/)

Components of the VPC:

* Private and Public Subnets    
    - The configuration for this scenario includes a VPC with a public and private subnets. We recommend this scenario if you want to run a public-facing web application, while maintaining back-end servers that aren't publicly accessible.
    - We will use 3 private subnets and 3 public subnets. Our EC2 instance for Jenkis will be attached to a public subnets in order to have internet connections. 

* Internet Gateway [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)

    - Internet gateway is a horizontally scaled, redundant, and highly available VPC component that allow communications between VPC and Internet. 
    - Internet Gateway should be attached to VPC. 
    - Add a route to your subnet's route that directs internet-bound traffic to the internet gateway. If a subnet is associated with a route table that has a route to an internet gateway, it's know as a public subnet. If a subent is associated with a route table that does not have a route to an internet gateway, it's know as a private subnet. 
* Route Table [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html)
    - route table contains a set of rules, called route, that are used to determine where network traffic from your subnet or gateway is directed. 
    - each subnet in your VPC must be associated with a route table. 

* Security Group AWS [link](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

    - security group acts as a virtual firewall for your instance to control inbound and outbound traffic. 
    - when you launch an instance in a VPC, you can assign up to five security groups to the instance.
    - security groups act at the instance level, not the subnet level. 
    - each instance in a subnet in your VPC can be assigned to a different set of security groups. 
    - by default a security group is dening all traffic, we need to specify which ports we want to use. 

* Key Pair [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

    - amazon ec2 uses public key cryptography to encrypt and decrypt login information. 
    - public key cryptography uses a public key to encrypt a piece of data, and then the recipiend uses the private key to decrypt the data. 
    - the public and private keys are know as a key pair.
    - public key cryptography enables you to securely access your instance using a private a key instead of a password. 

* Availability Zones [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)

    - availability zone is one or more discrete data center with redundant power networking, and connectivity is an AWS Region. 
    - availability zones allow you to operate production applications and databases that are more highly available, fault tolerant, and scalable than would be possible from a single data center. 
    - each region has a different number of availability zones, at least two is the minimum. 

* Amazon Elastic Compute Cloud (EC2) [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

    - Amazon EC2 provides scalable computing capacity in the AWS cloud
    - virtual computing environments, known as instances. 


    # Jenkins

> Automation Tool [link](https://www.jenkins.io/doc/)

* Jenkis is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software. 
    

# Deliver Infrastucture as code 

> Terraform 


* Write declarative configuration files. 

    - collaborate and share configurations
    - evolve and version your infrastructure 
    - automate provisioning 

* Plan and predict changes

    - clearly mapped resources dependencies 
    - separation of plan and apply
    - consistent, repeatable workflow. 

* Create reproducible infrastructure

    - reproducible production, staging, and development environments
    - shared modules for common infrastructure patterns
    - combine multiple providers consistently

# Terraform Structure.


 * [backend.tf](https://www.terraform.io/docs/backends/index.html)
    - backends determine where state is tored. 

 * [igw.tf](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)
    
    - provided resources to create a VPC Internet Gateway

 * [instance.tf](https://www.terraform.io/docs/providers/aws/r/instance.html)
    
    - provides an EC2 instance resources

 * [key_pair.tf](https://www.terraform.io/docs/providers/aws/r/key_pair.html)

    - key_pair deployer

 * [networking.tf](https://www.terraform.io/docs/providers/type/network-index.html)

    - networking resources provided in this file 

 * [null_resource.tf](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource)

    - resources that implements the standar lifecycle. 
    - Jenkis password will be displayd at the end. 
    - all atributes for Jenkis installation called remote-exec provisioner. 

 * [private_subnet.tf](https://www.terraform.io/docs/providers/aws/r/subnet.html)

    - resources for private subnets

 * [provider.tf](https://www.terraform.io/docs/providers/index.html)

    - provider is responsible for understanding API interactions and exposing resources. 

 * [public_subnet.tf](https://www.terraform.io/docs/providers/aws/r/subnet.html)
    
        - resources for public subnets. 

 * [securitygroupaws.tf](https://www.terraform.io/docs/providers/aws/r/security_group.html)

        - resources for security groups. 

 * [setenv.sh](https://www.terraform.io/docs/commands/environment-variables.html)

        - resources for set environmental variables

 * [variable.tf](https://www.terraform.io/docs/configuration/variables.html)

        - variables set-up

 * [vpc.tf](https://www.terraform.io/docs/providers/aws/r/vpc.html)

    - VPC resources

    /configurations/regions


    * [.tfvarsfiles](https://www.terraform.io/docs/configuration/variables.html)

        - variable definitions files, each regions has .tfvars files.               

    * bahrain.tfvars
    * canada.tfvars
    * frankfurt.tfvars
    * hong_kong.tfvars
    * ireland.tfvars
    * london.tfvars
    * milan.tfvars
    * mumbai.tfvars
    * ohio.tfvars
    * oregon.tfvars
    * paris.tfvars
    * sao_paulo.tfvars
    * seoul.tfvars
    * singapore.tfvars
    * stockholm.tfvars
    * sydney.tfvars
    * tokyo.tfvars
    * virginia.tfvars

<<<<<<< HEAD
Please read the instructions and requirements of the instance needed for jenkins
>>>>>>> 00e72a98abc4d6db7244943387990274d93285b7
=======
>>>>>>> 5dab2beba1be46808171d0b20c16e70c34b14be3
