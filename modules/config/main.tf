# this module is used to bundle all configuration together
variable "filename" {
   type = string
   description = "Filename that contains the commercetools project configuration settings"
   default = "ct-config.yml"
}

variable "envpath" {
   type = string
   description = "path to where the .env file fort this project can be found"
   default = ".env"
}

module "client" {
   source   = "../client"
   filename = var.envpath
}

locals {
   
   project_config = yamldecode(templatefile(var.filename, {}))  // read the project definition from the ct-config.yml file
   realms = tolist(local.project_config.realms)

}

output "client" { value = module.client }
output "countries" { value = distinct(flatten([for realm in local.realms : realm.countrycode])) }
output "currencies" { value = distinct(flatten([for realm in local.realms : realm.currencies])) }
output "languages" { value = distinct(flatten([for realm in local.realms : realm.languages])) }
output "realms" { value = local.realms }
output "labels" { value = local.project_config.labels }
output "zones" { value = local.project_config.zones }
output "shippingmethods" { value = local.project_config.shippingmethods }
