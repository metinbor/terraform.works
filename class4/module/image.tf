# data "aws_ami" "image" {
#   most_recent = true

#   owners = ["137112412989"] # Canonical 
# }



data "aws_ami" "image" { 

most_recent = true 

owners = ["${var.image_owner}"] # Canonical 

} 