variable "REGION" {
  default = "us-east-1"

}

variable "ZONE1" {
  default = "us-east-1a"

}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-033b95fb8079dc481"
    us-east-2 = "ami-0b614a5d911900a9b"
  }

}

variable "USER" {
  default = "ec2-user"

}