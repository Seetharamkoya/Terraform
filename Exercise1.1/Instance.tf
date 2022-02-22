provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-033b95fb8079dc481"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "new"
  vpc_security_group_ids = ["sg-0ced84288ca636216"]
  tags = {
    "Name"  = "new-instance1"
    Project = "ksr"
  }

}
