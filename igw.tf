# ACS-VPC
resource "aws_internet_gateway" "acs-gw" {
  vpc_id = "${data.aws_vpc.selected_acs-vpc.id}"

  tags = {
    Name = "igw-acs"
  }
  depends_on = ["aws_vpc.acs-vpc"]
}

# Transfer-IGW
resource "aws_internet_gateway" "transfer-gw" {
  vpc_id = "${data.aws_vpc.selected_transfer-vpc.id}"

  tags = {
    Name = "igw-transfer"
  }
  depends_on = ["aws_vpc.transfer-vpc"]
}

# VWS-IGW
resource "aws_internet_gateway" "vws-gw" {
  vpc_id = "${data.aws_vpc.selected_vws-vpc.id}"

  tags = {
    Name = "igw-vws"
  }
  depends_on = ["aws_vpc.vws-vpc"]
}
