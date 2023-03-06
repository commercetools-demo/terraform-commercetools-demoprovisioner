# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

variable "zones" {
   type = list(
      object({
         name = string,
         countries = list(string)
      })
   )
}

resource "commercetools_shipping_zone" "zone" {
   for_each = {for key, value in var.zones : key => value }
   key         = "zone-${lower(each.value.name)}"
   name        = "${title(each.value.name)} Zone"
   description = "Shipping zone for ${title(each.value.name)}"
   dynamic "location" {
      for_each = each.value.countries
      iterator = loc
      content {
         country = loc.value 
      }   
   }
}

output "allzones" {
   value = commercetools_shipping_zone.zone
}