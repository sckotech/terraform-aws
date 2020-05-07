### aws subnet ###

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = length(var.public-subnet-cidr)
  vpc_id                  = aws_vpc.myvpc.id
  map_public_ip_on_launch = true
  #cidr_block        = var.public-subnet-cidr[count.index]
  cidr_block              = element(var.public-subnet-cidr,count.index)
  #availability_zone       = data.aws_availability_zones.available.names[count.index]
  availability_zone       = element(var.azs,count.index)

  tags = {
    Name = "public"
  }
}


#resource "aws_subnet" "private" {
#  count = length(var.private-subnet-cidr)
#  vpc_id            = aws_vpc.myvpc.id
#  cidr_block        = var.private-subnet-cidr[count.index]
#  availability_zone = data.aws_availability_zones.available.names[count.index]

#  tags = {
#    Name = "private"
#  }
#}


