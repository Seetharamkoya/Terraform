resource "aws_instance" "ksr-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "ksr_new"
  vpc_security_group_ids = ["sg-0ced84288ca636216"]
  tags = {
    "Name"  = "new-instance1"
    Project = "ksr-new"
  }

}