variable "rate" {
   type = object({
      name = string,
      pct = number,
      country = string,
      cat_id: string
   })
   description = "object that describes the tax rate"
}

# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

resource "commercetools_tax_category_rate" "rate" {
   tax_category_id   =  var.rate.cat_id #[for cat in commercetools_tax_category.category : cat.id if cat.key == "zero"]
   name              = var.rate.name
   amount            =  var.rate.pct
   included_in_price = true
   country           = var.rate.country
}