provider "aws" {
    region = "${var.region}"
}
#EC2 instance resources below
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
  availability_zone = "${var.region}a"
  instance_type = "t2.micro"
    tags = "${var.tags}"
}

#route 53 resources. 
resource "aws_route53_record" "www" {
  zone_id = "Z06878433EPIGG49CHG0N" #hosted zone id from rt 53
  name    = "www.vitaliejicol.com"
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.web.public_ip}"]
}

resource "aws_instance" "web2" {
    ami           = "${data.aws_ami.ubuntu.id}"
    availability_zone = "${var.region}a"
  instance_type = "t2.micro"
  tags = "${var.tags}"

  # (resource arguments)
}


resource "aws_ebs_volume" "example" {
  availability_zone = "${var.region}a"
  size              = 8
  tags = "${var.tags}"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.web2.id}"
}