resource "aws_instance" "webserver" {
  count              = length(var.public-subnet-cidr)
  ami                = "ami-085925f297f89fce1"
  instance_type      = "t2.micro"
  availability_zone  = element(var.azs, count.index)
  subnet_id          = element(aws_subnet.public.*.id, count.index)
  key_name           = "terraform"
  #security_groups    = [aws_security_group.myvpc-sg.id]
  vpc_security_group_ids = [aws_security_group.myvpc-sg.id]
  user_data          = file("httpd.sh")
  
  disable_api_termination = true
  associate_public_ip_address = true
  
  tags = {
    Name = "webserver-${count.index + 1}"
  }
}
