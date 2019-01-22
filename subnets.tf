# Create a subnet for Transfer-VPC
resource "aws_subnet" "transfer-vws-subnet-a" {
  vpc_id = "${aws_vpc.transfer-vpc.id}"
  availability_zone = "eu-central-1a"
  cidr_block = "${data.template_file.cidr_transfer-vws-subnet-a.rendered}"
  tags {
    Name = "transfer-vws-subnet-a"
  }
}

# Add subnet to Transfer-VPC's secondary CIDR block (ensure correct dependency ordering)
resource "aws_subnet" "transfer-audi-subnet-a" {
  vpc_id = "${aws_vpc_ipv4_cidr_block_association.secondary_cidr-a.vpc_id}"
  availability_zone = "eu-central-1a"
  cidr_block = "${data.template_file.cidr_transfer-audi-subnet-a.rendered}"
  tags {
    Name = "transfer-audi-subnet-a"
  }
}


# Subnets for availibility zone b
resource "aws_subnet" "transfer-vws-subnet-b" {
  vpc_id = "${aws_vpc.transfer-vpc.id}"
  availability_zone = "eu-central-1b"
  cidr_block = "${data.template_file.cidr_transfer-vws-subnet-b.rendered}"
  tags {
    Name = "transfer-vws-subnet-b"
  }
}

resource "aws_subnet" "transfer-audi-subnet-b" {
  vpc_id = "${aws_vpc.transfer-vpc.id}"
  availability_zone = "eu-central-1b"
  cidr_block = "${data.template_file.cidr_transfer-audi-subnet-b.rendered}"
  tags {
    Name = "transfer-audi-subnet-b"
  }
}