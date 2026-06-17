resource "aws_instance" "jenkins" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"

  user_data = file("jenkins.sh")

  tags = {
    Name = "jenkins"
  }

  root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }
}

resource "aws_instance" "jenkins-agent" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"

  user_data = file("jenkins-agent.sh")

  tags = {
    Name = "jenkins-agent"
  }

  root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }
}
# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "~> 2.0"

#   zone_name = var.zone_name

#   records = [
#     {
#       name    = "jenkins"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins.public_ip
#       ]
#       allow_overwrite = true
#     },
#     {
#       name    = "jenkins-agent"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins_agent.private_ip
#       ]
#       allow_overwrite = true
#     }
#   ]

# }