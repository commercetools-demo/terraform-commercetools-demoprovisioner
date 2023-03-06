# register the terraform provider
terraform {
  required_providers {
    commercetools = {
      source = "labd/commercetools"
    }
  }
}

variable "projectconfig" {
  type = object({
    project_key = string
    countries = list(string)
    currencies = list(string)
    languages = list(string)
  })
}

resource "commercetools_project_settings" "project" {
  # do not edit these setting, automatically generated from ct_config.yml
  name = var.projectconfig.project_key
  countries = var.projectconfig.countries
  currencies = var.projectconfig.currencies
  languages = var.projectconfig.languages

  # here you are free to change what you want
  enable_search_index_products = true
  enable_search_index_orders   = true
}
