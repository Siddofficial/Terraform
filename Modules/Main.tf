provider aws {
    region = "us-east-1"
}

module "windows" {
  source = "./module/"
}
