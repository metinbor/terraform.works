# # Create a new instance of the latest Ubuntu 14.04 on an
# # t2.micro node with an AWS Tag naming it "HelloWorld"

 data "aws_ami" "centos" { # with this command it will find for us the latest intsllation in any region
   most_recent = true

   filter {
     name   = "name"
     values = ["CentOS Linux 7 x86_64 HVM EBS *"]
   }

   filter {
     name   = "virtualization-type"
     values = ["hvm"]
   }

   owners = ["679593333241"] # Canonica

 }
 output "CENTOS_AMI_ID" {
 value = "${data.aws_ami.centos.id}"
 }

# # resource "aws_instance" "web" {
# #   ami           = "${data.aws_ami.centos.id}"
# #   instance_type = "t2.micro"

# #   tags = {
# #     Name = "HelloWorld"
# #   }
# # }