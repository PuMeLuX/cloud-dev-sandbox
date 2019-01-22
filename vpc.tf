# Create Transfer-VPC
resource "aws_vpc" "transfer-vpc" {
  cidr_block = "${data.template_file.cidr_primary_peer-peer-transfer-vpc-audi-vws.rendered}"
  
  tags {
      Name = "transfer-vpc"
  }
}

# Create ACS-VPC
resource "aws_vpc" "acs-vpc" {
  cidr_block = "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"
  
  tags {
      Name = "acs-vpc"
  }
}

# Create VWS-VPC
resource "aws_vpc" "vws-vpc" {
  cidr_block = "${data.template_file.cidr_vws_subnet_to_peer.rendered}"
  
  tags {
      Name = "vws-vpc"
  }
}

# Add further IPv4 CIDR block to the Transfer-VPC
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr-a" {
  vpc_id     = "${aws_vpc.transfer-vpc.id}"
  cidr_block = "${data.template_file.cidr_secondary_peer-peer-transfer-vpc-audi-vws-a.rendered}"
}