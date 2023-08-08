
# register the terraform provider, this needs to happen in the root module
terraform {
  required_providers {
    commercetools = {
      source = "labd/commercetools"
    }
  }
}

variable "configfile" {
  type = string
  description = "The file .yml that contains the configuration"
}

variable "envpath" {
  type = string
  description = "path to where the .env file fort this project can be found"
  default = ".env"
}

provider "commercetools" {
  client_id     = module.realms.config.client.client_id
  client_secret = module.realms.config.client.client_secret
  project_key   = module.realms.config.client.project_key
  token_url     = module.realms.config.client.auth_url
  api_url       = module.realms.config.client.api_url
  scopes        = module.realms.config.client.scopes
}

# setup all realms, realms will deal with channels stores etc
module "realms" {
  source   = "./modules/realms"
  configfile = var.configfile
  envpath = var.envpath
}

output "config" {
  value = module.realms.config
  description = "The config object contains the configuration read from the .yml file"
}

