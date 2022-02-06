
resource "aws_instance" "exasmple" {
  ami = data.aws_ami.windows.id
  instance_type = "t2.micro"
  availability_zone = var.availability_zone
}



data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["801119661308"] # Canonical
}

resource "aws_ebs_volume" "example" {
  availability_zone = var.availability_zone
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.exasmple.id
}
