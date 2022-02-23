resource "aws_key_pair" "ksr1" {
  key_name   = "ksrkey"
  public_key = file("ksrkey.pub")

}

resource "aws_instance" "ksr-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "ksrkey"
  vpc_security_group_ids = ["sg-0ced84288ca636216"]
  tags = {
    "Name"  = "new-instance1"
    Project = "ksr-new"
  }


  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

  }
  connection {
    user        = var.USER
    private_key = file("ksrkey")
    host        = self.public_ip

  }
}

output "PublicIP" {
  value = aws_instance.ksr-inst.public_ip

}

output "PrivateIP" {
  value = aws_instance.ksr-inst.private_ip

}