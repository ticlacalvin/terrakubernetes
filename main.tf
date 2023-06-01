provider "aws" {
  region  = "us-east-1"
}
terraform {
   backend "s3" {
    bucket = "calvin.k8s.local"
    key    = "default.tfstate"
    region = "ap-south-1"
  }
}
module "kubernetes" {
  source = "./kubernetes"
  ami = "ami-05837ec657e30ea41"
  cluster_name = "kubeadm-cluster"
  master_instance_type = "t3.medium"
  nodes_max_size = 1
  nodes_min_size = 1
  private_subnet01_netnum = "1"
  public_subnet01_netnum = "2"
  region = "us-east-1"
  vpc_cidr_block = "10.240.0.0/16"
  worker_instance_type = "t3.medium"
  vpc_name = "kubernetes"
  ssh_public_key = "sshkey"
}
