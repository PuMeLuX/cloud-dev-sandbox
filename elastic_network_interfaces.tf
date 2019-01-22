resource "aws_network_interface" "audi-vws-transfer-proxy-audi-a" {
  subnet_id       = "${aws_subnet.transfer-audi-subnet-a.id}"
  private_ips     = ["${data.template_file.ip_proxy_eni_audi_facing-a.rendered}"]
  security_groups = ["${aws_security_group.gmdm-aws-eu-central-1-sg-transfer-proxy-a.id}"]
}

resource "aws_network_interface" "audi-vws-transfer-proxy-audi-b" {
  subnet_id       = "${aws_subnet.transfer-audi-subnet-b.id}"
  private_ips     = ["${data.template_file.ip_proxy_eni_audi_facing-b.rendered}"]
  security_groups = ["${aws_security_group.gmdm-aws-eu-central-1-sg-transfer-proxy-a.id}"]
}

resource "aws_network_interface" "audi-vws-transfer-proxy-vws-a" {
  subnet_id       = "${aws_subnet.transfer-vws-subnet-a.id}"
  private_ips     = ["${data.template_file.ip_proxy_eni_vws_facing-a.rendered}"]
  security_groups = ["${aws_security_group.gmdm-aws-eu-central-1-sg-transfer-proxy-a.id}"]
}
resource "aws_network_interface" "audi-vws-transfer-proxy-vws-b" {
  subnet_id       = "${aws_subnet.transfer-vws-subnet-b.id}"
  private_ips     = ["${data.template_file.ip_proxy_eni_vws_facing-b.rendered}"]
  security_groups = ["${aws_security_group.gmdm-aws-eu-central-1-sg-transfer-proxy-a.id}"]
}