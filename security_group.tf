resource "aws_security_group" "app_sg" {
 name = "APP_SG"
 description = "Allow SSH and HTTP inbound traffic"
 vpc_id = "${aws_vpc.vpc_main.id}"
 
 ingress {
  from_port = 22
  to_port = 22
  protocol = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
  from_port = 80
  to_port = 80
  protocol = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
 
 tags = {
  Name = "${var.app_name} security-group"
 }
}

resource "aws_security_group" "rds_sg" {
 name = "RDS_SG"
 description = "${var.app_name}-rds-sg"
 vpc_id = "${aws_vpc.vpc_main.id}"

 ingress {
  from_port = 3306
  to_port = 3306
  protocol = "TCP"
  security_groups = ["${aws_security_group.app_sg.id}"]
 }	
 egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 }
}
