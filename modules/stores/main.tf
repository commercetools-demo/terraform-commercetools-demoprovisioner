variable "storesconfig" {
   type = object({
      realm = object({
         name = string,
         key = string,
         countrycode = string,
         languages = list(string),
         currencies = list(string)
      })
      languages = list(string)
   })
}

# register the terraform provider
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}

locals{
   names = { for lang in var.storesconfig.languages : "${lang}" => "Store in ${var.storesconfig.realm.name}" } # create a name for each used language
   descriptions = { for lang in var.storesconfig.languages : "${lang}" => "The store in ${var.storesconfig.realm.name}" } # create a description for each used language
}

resource "commercetools_store" "store" {
   name = local.names
   key = "channel-${var.storesconfig.realm.key}"
   languages = var.storesconfig.realm.languages
   distribution_channels = ["distribution-channel-${var.storesconfig.realm.key}"]
   supply_channels = ["supply-channel-${var.storesconfig.realm.key}"]
}
