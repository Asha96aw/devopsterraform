
resource "aws_instance" "Web" {
  count             = "3"
  ami               = "ami-053b0d53c279acc90"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "id_rsa"
  security_groups   = ["launch-wizard-3"]
  #install apache2 in remote server
  user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install apache2 -y
                EOF
 # tags = merge(var.common_tags,{"Name"="DemoPro-${count.index}"})


}
resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCogyA5dZAjqrq0TF1O8HWSY6gI4N2qBONtW24kg3/HkPB3XHummufACSZkKsO0ExD5ykWoQKJeBrtFXWBo0Yn/UOtUCU3+2MBC7191OXNxHFlj3R2y2fiMX9t2cNFvwkiBSQj58c+hArU7ljVhPD+nvX8lHZGm5TJMRblfkCMZBug8CJgu71eur+zHmWDMM86JiRnjfy60Rk49VS6f7u0SYM7bSukcFjMS7dXFApDeX8IpNcit3ZQY+w7xyC0KagCfdSVpsDWMpCmZNVkL0tn2yCDu2TQ44/RGayGq0cjvvusDtOWO8osCn67Ef6M82YLJ5VifHuRWJfJvqY4/XNT ubuntu@ip-172-31-95-183"

}  

