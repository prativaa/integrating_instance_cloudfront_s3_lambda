resource "aws_key_pair" "app_keypair" {
 key_name = "appkeypair"
 public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
