# Create a peering connection to peer Audi Transfer VPC (Requester) <--> MDM User VPC (Accepter)
resource "aws_vpc_peering_connection" "peer-transfer-acs" {
  peer_vpc_id = "${data.aws_vpc.selected_acs-vpc.id}" # MDM User VPC (Accepter VPC ID)
  vpc_id = "${aws_vpc.transfer-vpc.id}" # Audi Transfer VPC (Requester VPC ID)
  auto_accept = true # Auto_accept the peering (both VPCs need to be in the same AWS account)

  tags {
    Name = "peer-transfer-acs"
  }
}

resource "aws_vpc_peering_connection" "peer-transfer-vws" {
  peer_vpc_id = "${data.aws_vpc.selected_vws-vpc.id}" # MDM User VPC (Accepter VPC ID)
  vpc_id = "${aws_vpc.transfer-vpc.id}" # Audi Transfer VPC (Requester VPC ID)
  auto_accept = true # Auto_accept the peering (both VPCs need to be in the same AWS account)

  tags {
    Name = "peer-transfer-vws"
  }
}
