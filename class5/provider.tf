provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
   availability_zone = "${var.region}a"

 
  
}

  resource "aws_route53_record" "www" {
    zone_id = "$${Z06878433EPIGG49CHG0N}"        # you can get this from aws/rt53/hosted zone
    name    = "www.vitaliejicol.com"
    type    = "A"
    ttl     = "5"
    records = ["${aws_instance.web.public_ip}"]
  }

resource "aws_instance" "web2" {
     ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = "${var.tags}"


  resource "aws_ebs_volume" "example" {
  availability_zone = "${var.region}a"
  size              = 8

  tags = "${var.tags}"
}

 resource "aws_volume_attachment" "ebs_att" {
   device_name = "/dev/sdh"
   volume_id   = "${aws_volume_attachment.ebs_att.id}"
   instance_id = "${aws_instance.web2.id}"
 }


  # (resource arguments)
}