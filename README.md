# commercetools demoprovisioner

![logo](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/logo.jpg)

This module uses a config file to create a standardized demo environment. For now only for EMEA based setups. The module is using the fantastic [Lab Digital commercetools provider](https://registry.terraform.io/providers/labd/commercetools/latest)

***Pre requisites:***
- a ```ct-config.yml``` file like [this](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/ct-config.yml) in the root
- a ```.env``` file in the root
- a ```main.tf``` in the root

the ```main.tf``` file should look like this

```hcl
module "demoprovisioner" {
   source  = "commercetools-demo/demoprovisioner/commercetools"
   version = "1.0.7" // see for latest version in github
   configfile = "./ct-config.yml"
}

# register the terraform provider, this needs to happen in the root module
terraform {
   required_providers {
      commercetools = {
         source = "labd/commercetools"
      }
   }
}


provider "commercetools" {
   client_id     = module.demoprovisioner.config.client.client_id
   client_secret = module.demoprovisioner.config.client.client_secret
   project_key   = module.demoprovisioner.config.client.project_key
   token_url     = module.demoprovisioner.config.client.auth_url
   api_url       = module.demoprovisioner.config.client.api_url
   scopes        = module.demoprovisioner.config.client.scopes
}
```

***usage***
1. ```terraform init```
2. ```terraform plan``` to see the expected changes
3. ```terraform apply``` to apply the changes

***Expected output after the apply:***

## International

![international](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/international.jpg)


## Taxes
![taxes](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/taxes.jpg)
## Shipping methods
![shipping](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/shipping.jpg)
## Channels
![channels](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/channels.jpg)
## Stores
![stores](https://raw.githubusercontent.com/commercetools-demo/terraform-commercetools-demoprovisioner/master/examples/stores.jpg)