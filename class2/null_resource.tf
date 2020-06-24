resource "null_resource" "jenkins_password" {
    depends_on = ["aws_instance.my_instance"]
    triggers = {
        always_run = "${timestamp()}"
  }
    provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "centos"
      #user        = "${var.user}"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${aws_instance.my_instance.public_ip}"
    }
    
    inline = [
      "sudo yum install java-1.8.0-openjdk -y",
      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      #"sudo yum install ${var.jenkins_version} -y",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      "sudo yum install -y jenkins",
      "sudo systemctl start jenkins",
      "sudo systemctl enable jenkins",
      "echo -e $(tput setaf 1 )'Jenkins initialAdminPassword: '$(tput sgr0) $(tput setaf 2)`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`$(tput sgr0)",  
    ] // This is a list of command strings. They are executed in the order they are provided
  } 
}