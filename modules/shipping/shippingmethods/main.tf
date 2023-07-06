# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

variable languages { type = list(string)}
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



resource "commercetools_shipping_method" "shipping-method" {
   for_each = {for key, value in var.shippingmethods : key => value }
   key             = "${lower(each.value.name)}-shipping-method"
   name            = "${each.value.name} Shipping Method"
   description     = "${each.value.name} Shipping Method Description "
   localized_description = merge([for ckey, country in var.languages : {
      "${country}" = "Shipping Method ${title(each.value.name)}"
   }]...)
   is_default      = (lower(each.value.name) == "standard") ? true : false
   tax_category_id = var.standardtax.id
   predicate       = "${each.value.predicate}"
}

output "allmethods" {
   value = commercetools_shipping_method.shipping-method
}