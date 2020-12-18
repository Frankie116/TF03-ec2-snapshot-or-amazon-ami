resource "aws_ami" "my-ami" {
  # count                  = var.use-snapshot ? 1 : 0
  name                   = "my-snapshot-ami"
  virtualization_type    = "hvm"
  root_device_name       = "/dev/sda1"

  ebs_block_device {
    snapshot_id          = data.aws_ebs_snapshot.my-existing-snapshot.id
    device_name          = "/dev/sda1"
  }
}

data "aws_ebs_snapshot" "my-existing-snapshot" {
  most_recent            = true
  owners                 = ["self"]

  filter {
    name                 = "tag:Name"
    values               = ["my-snapshot-latest"]
  }
}