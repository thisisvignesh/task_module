//vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = {
    Name = var.vpc
  }
}

//subnet
resource "aws_subnet" "subnet_public" {

  vpc_id = aws_vpc.vpc.id

  cidr_block              = var.subnetcidr
  map_public_ip_on_launch = "true"

  availability_zone = var.subzone

  tags = {

    Name = var.subnet

  }

}
//IGW
resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id

  tags = {

    Name = var.igw

  }

}
//RT

resource "aws_route_table" "rtb_public" {

  vpc_id = aws_vpc.vpc.id

  route {

    cidr_block = var.rtcidr
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {

    Name = var.rt
  }
}
//CREATE A FILE SUBNETASS.TF WHICH IS USED TO MAKE OUR SUBNET PUBLIC

resource "aws_route_table_association" "rta_subnet_public" {

  subnet_id = aws_subnet.subnet_public.id

  route_table_id = aws_route_table.rtb_public.id


}


//CREATE A FILE SG.TF FOR ACCESSING THE EC2 INSTANCE ON PORT 22

resource "aws_security_group" "sg" {

  name = var.sgname

  vpc_id = aws_vpc.vpc.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = var.sgcidr

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = var.sgcidr

  }

  tags = {

    Name = var.sgprotocol

  }

}
// AT LAST CREATE A FILE EC2.TF WHICH WE USED TO EC2 INSTANCE IN OUR SUBNET, VPC

resource "aws_instance" "testInstance" {

  ami = var.amiid

  instance_type = var.machinetype

  subnet_id = aws_subnet.subnet_public.id

  tags = {

    Name = var.mytag

  }

}