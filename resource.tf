resource "aws_instance" "TEST12345" {
     ami = "ami-0715c1897453cabd1"
     instance_type = "t2.micro"
}

 

resource "aws_eip" "myeip" {
    vpc = "true"

}

 

resource "aws_security_group" "elb" {
  name        = "example-elb-sg1"
  description = "Security group for example ELB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

 


resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-backend808800"
acl    = "private"
}

 

resource "aws_iam_user" "lb" {
  name = "demo-user.${count.index}"
  count = 3
  path = "/system/"
}

 

output "arns" {
  value = aws_iam_user.lb[*].arn
}

 

output "name" {
  value = aws_iam_user.lb[*].name
}

 


output "zipmap" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}
