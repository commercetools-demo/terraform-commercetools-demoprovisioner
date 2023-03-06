# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

variable "languages" { type = list(string)}
variable "standardtax" { } # this is pushed up from tax
variable "shippingmethods" {
   type = list(
      object({
         name = string,
         tax-category = string,
         predicate = string,
         zones = list(
            object({
               key = string,
               rates = list(
                  object({
                     currency = string,
                     normal: number,
                     free-above: number,
                  })
               )
            })
         )
      })
   )
}

variable "zones" {}

module "zones" {
   source = "./shipingzones"
   zones = var.zones
}

module "methods" {
   source = "./shippingmethods"
   shippingmethods = var.shippingmethods
   standardtax = var.standardtax
   languages = var.languages
}

module "rates" {
   source = "./shippingrates"
   rateslist = flatten([for key, method in var.shippingmethods: 
      flatten([for zkey, zone in method.zones : 
         [for rkey, rate in zone.rates : {
            method              = "${lower(method.name)}-shipping-method"
            zone                = "zone-${lower(zone.key)}"
            rate                = rate
            shipping_method_ref = one([for smethod in module.methods.allmethods: smethod if smethod.key == "${lower(method.name)}-shipping-method"])
            shipping_zone_ref   = one([for szone in module.zones.allzones: szone if szone.key == "zone-${lower(zone.key)}"])
         }]
      ])
   ])
}