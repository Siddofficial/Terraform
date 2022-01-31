provider aws {
    region = "us-east-1"
}

resource "aws_instance" "ec2Ass" {
    ami = "ami-0aad84f764a2bd39a"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    monitoring = true
    tags = {
      name = "test"
      environment = "dev"
    }
  
}
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size = 40
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.example.id
    instance_id = aws_instance.ec2Ass.id
}
