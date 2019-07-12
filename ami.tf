data "aws_ami" "amazon-linux-2" {
 owners = ["amazon"]
 most_recent = true
 
 filter {
  name   = "name"
  values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
 }
 
 filter {
  name = "owner-alias"
  values = ["amazon"]
 }

 filter {
  name   = "virtualization-type"
  values = ["hvm"]
 }

 filter {
  name = "architecture"
  values = ["x86_64"]
 }
 
 filter {
  name = "state"
  values = ["available"]
 }
}
