resource "aws_security_group" "myvpc-sg" {
  name        = "myvpc-sg"
  description = "Allow http traffic"
  vpc_id      = aws_vpc.myvpc.id
                
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "myvpc-sg"
  }
}