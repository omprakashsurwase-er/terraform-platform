


 module "dev2-ec2" {

   source = "../../modules/ec2"

  name        = "dev2-ec2"
  environment = "dev"

  ami_id        = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"

  subnet_id = "subnet-05c05d1fdc7d4bea0"

  security_group_ids = [
    "sg-08b803928cbfa1597"
  ]

  key_name = "devops"
}                      
