# load the config from the default ct-config.yml file
module "config" {
   source   = "../config"
}

module "Project" {
   source = "../project"
   projectconfig = {
      countries = module.config.countries
      currencies = module.config.currencies
      languages = module.config.languages
      project_key = module.config.client.project_key
   }
   depends_on = [ module.config ]
}

module "SupplyChannels" {
   source = "../channels"
   for_each = {for key, value in module.config.realms : key => value }
   channelconfig = {
      labels = module.config.labels
      languages = module.config.languages 
      realm = each.value
      roles = ["InventorySupply"]
   }
   depends_on = [ module.Project  ]
}

module "DistributionChannels" {
   source = "../channels"
   for_each = {for key, value in module.config.realms : key => value }
   channelconfig = {
      labels = module.config.labels
      languages = module.config.languages 
      realm = each.value
      roles = ["ProductDistribution"]
   }
   depends_on = [ module.Project  ]
}

module "Stores" {
   source = "../stores"
   for_each = {for key, value in module.config.realms : key => value }
   storesconfig = {
      languages = module.config.languages 
      realm = each.value
   }
   depends_on = [ module.DistributionChannels, module.SupplyChannels  ]
}

module "Tax" {
   source = "../tax"
   realms = module.config.realms
   depends_on = [ module.config  ]
}

module "Shipping" {
   source = "../shipping"
   standardtax = one(module.Tax.taxstandard)
   shippingmethods = module.config.shippingmethods
   zones = module.config.zones
   languages = module.config.languages
   depends_on = [ module.Tax  ]
}

output "config" {
   value = module.config
}

output "realmtax" {
   value = one(module.Tax.taxstandard)
}

output "languages" {
   value = module.config.languages
}