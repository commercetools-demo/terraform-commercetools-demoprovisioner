variable "channelconfig" {
   type = object({
      languages = list(string)
      labels = object({
         supplychannellabel = string
         distributionchannellabel = string
      })
      roles = list(string)
      realm = object({
         name = string,
         key = string,
         countrycode = string,
         languages = list(string),
         currencies = list(string)
      })
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
   role = contains(var.channelconfig.roles, "InventorySupply") ? "supply" : "distribution" # determine the role (only supply and distribution)
   label = (local.role == "supply") ? var.channelconfig.labels.supplychannellabel : var.channelconfig.labels.distributionchannellabel
   names = { for lang in var.channelconfig.languages : "${lang}" => "${title(local.role)} Channel ${var.channelconfig.realm.name}" } # create a name for each used language
   descriptions = { for lang in var.channelconfig.languages : "${lang}" => "The ${local.label} in ${var.channelconfig.realm.name}" } # create a description for each used language
}

resource "commercetools_channel" "channel" {
   key = "${local.role}-channel-${var.channelconfig.realm.key}"
   roles = var.channelconfig.roles
   name = local.names
   description = local.descriptions
}
