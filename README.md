## ----------------------------------------------------------------------------
# version  3.0
#  Project: TF-TF-ec2-snapshot-or-amazon-ami
## Purpose: To create a terraform run that will build an ec2 instance using
## either a pre-existing snapshot or a standard amazon linux ami.
## User will be prompted for option at TF launch.
   Author:  Frank Effrim-Botchey
## ----------------------------------------------------------------------------


## modules:
vpc

app_security_group

elb_http

lb_security_group

## data:
aws_ebs_snapshot 

aws_availability_zones

template_file


## resources:

aws_ami

aws_instance

random_string

script:

my-script.sh
