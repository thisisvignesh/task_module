
module "instance_provisioning" {
  source      = "../module"
  vpc         = var.vpc
  subnet      = var.subnet
  sgname      = var.sgname
  cidr        = var.cidr
  subzone     = var.subzone
  rt          = var.rt
  rtcidr      = var.rtcidr
  subnetcidr  = var.subnetcidr
  sgprotocol  = var.sgprotocol
  igw         = var.igw
  mytag       = var.mytag
  amiid       = var.amiid
  machinetype = var.machinetype
  keyname     = var.keyname
}
