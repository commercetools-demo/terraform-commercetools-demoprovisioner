variable "filename" {
   type = string
   description = "path of of the .env file"
   default = ".env"
}

locals {
   ct_client = { for tuple in regexall("(.*)=(.*)", file(var.filename)) : tuple[0] => tuple[1] } // this reads the commercetools client info from the .env file
   # mapping them here for conveniance
   
   client_id     = local.ct_client["CTP_CLIENT_ID"]
   client_secret = local.ct_client["CTP_CLIENT_SECRET"]
   project_key   = local.ct_client["CTP_PROJECT_KEY"]
   auth_url      = local.ct_client["CTP_AUTH_URL"]
   api_url       = local.ct_client["CTP_API_URL"]
   scopes        = local.ct_client["CTP_SCOPES"]
}

output "client_id" { 
   value = local.client_id 
   description = "commercetools client_id"
}

output "client_secret" { 
   value = local.client_secret 
   description = "commercetools client_secret"
}
output "project_key" { 
   value = local.project_key 
   description = "commercetools project_key"
}
output "auth_url" { 
   value = local.auth_url 
   description = "commercetools auth_url"
}
output "api_url" { 
   value = local.api_url 
   description = "commercetools api_url"
}
output "scopes" { 
   value = local.scopes 
   description = "commercetools scopes"
}