provider "aws" {
  region = var.region
}

provider "local" {
  version = "~> 2.0"
}
