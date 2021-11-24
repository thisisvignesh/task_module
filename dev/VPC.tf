
module "instance_provisioning" {
  source      = "../module"
  cidr        = var.cidr
  vpc         = var.vpc
  subnet      = var.subnet
  sgname      = var.sgname
  subzone     = var.subzone
  rt          = var.rt
  rtcidr      = var.rtcidr
  sgcidr      = var.sgcidr
  subnetcidr  = var.subnetcidr
  sgprotocol  = var.sgprotocol
  igw         = var.igw
  mytag       = var.mytag
  amiid       = var.amiid
  machinetype = var.machinetype
  keyname     = var.keyname
}
