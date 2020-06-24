provider "aws" { 

region = "us-east-1" 

} 

data "aws_ami" "image" {
  most_recent = true

  owners = ["137112412989"] # Canonical 
}

resource "aws_launch_template" "example" {
  name_prefix = "example"

  image_id = "${data.aws_ami.image.id}"

  instance_type = "c5.large"
  key_name      = "${aws_key_pair.us-east-1-key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.asg-sec-group.id}"]
}

resource "aws_autoscaling_group" "example" {
  availability_zones = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c",
  ]

  desired_capacity = 1

  max_size = 1

  min_size = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.example.id}"
      }

      override {
        instance_type = "c4.large"

        weighted_capacity = "3"
      }

      override {
        instance_type = "c3.large"

        weighted_capacity = "2"
      }
    }
  }
}
