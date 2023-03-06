variable "category" {
   type = object({
      name = string,
      rates = list(
         object({
            name = string,
            pct = number,
            country = string
         })
      )
   })
   description = "object that describes the tax categories"
}

# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

resource "commercetools_tax_category" "category" {
   name = var.category.name
   key  = var.category.name
   description= var.category.name
}

module "rates" {
   source = "./rates"
   for_each = {for key, value in var.category.rates : key => value } 
   rate = {
      cat_id = commercetools_tax_category.category.id
      country = each.value.country
      name = each.value.name
      pct = each.value.pct
   }
}

output "categories" {
   value = commercetools_tax_category.category
}