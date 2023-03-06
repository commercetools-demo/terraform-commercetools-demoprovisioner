variable "realms" {
   type = list(
      object({
         name = string,
         key = string,
         countrycode = string,
         languages = list(string),
         currencies = list(string),
         tax = list(
            object({
               category = string,
               name = string,
               pct = number,
            })
         )
      })
   )
   description = "object that describes the realms"
}

# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

locals {
   taxcategories = distinct(flatten([for realm in var.realms : [ // get all the categories we have configured
      for tax in realm.tax : [{
         name = tax.category   
      }]
   ]]))

   taxrates = flatten([
      for realmkey, realm in var.realms : [
         for taxkey, tax in realm.tax : [
         {
            name = "${tax.name}-${lower(realm.countrycode)}",
            pct = tax.pct
            category = tax.category
            country = realm.countrycode
         }]
      ]
   ])

   taxtable = [for category in local.taxcategories : {
      name = category.name
      rates = [for rate in local.taxrates: 
      {
         pct = rate.pct
         country = rate.country
         name = rate.name
      }
      if rate.category == category.name ] 
   }] 
}

output "cat" {
   value = local.taxtable
}

module "category" {
   source = "./categories"
   for_each = {for key, value in local.taxtable : key => value }
   category = each.value
}

output "taxstandard" {
   value = [for category in module.category : category.categories if category.categories.key == "standard"]
}