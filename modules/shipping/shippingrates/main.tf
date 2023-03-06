# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

variable "rateslist" {}

resource "commercetools_shipping_zone_rate" "zone-rate" {
   for_each = {for key, value in var.rateslist : key => value }
   shipping_method_id = each.value.shipping_method_ref.id
   shipping_zone_id   = each.value.shipping_zone_ref.id
   price {
      cent_amount   = each.value.rate.normal
      currency_code = each.value.rate.currency
   }
   free_above {
      cent_amount   = each.value.rate.free-above
      currency_code = each.value.rate.currency
   }
}