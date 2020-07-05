resource "aws_key_pair" "bastion_key" {
  key_name = "${var.key_name}" #this will have the key pairs for the instances

  #key_name = "jenkis_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
