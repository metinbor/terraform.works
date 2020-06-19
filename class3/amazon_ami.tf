# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"

data "aws_ami" "amazon" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"] # Canonical
}
output "AMAZON_AMI_ID" {
    value = "${data.aws_ami.amazon.id}"
}

# resource "aws_instance" "web" {
#   ami           = "${data.aws_ami.centos.id}"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }