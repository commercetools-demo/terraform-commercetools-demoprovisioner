---
page_title: "commercetools demo provisioner"
subcategory: ""
description: |-
  The commercetools demo provisioner is helpful to setup a demo project

---

# commercetools demo provisioner module

## Commercial support
This module is created to formulate a unified demo setup. No commercial support is provided or planned

## Installation
Terraform automatically downloads modules from the terraform registry. Add the
following to your terraform project


```hcl
module "demoprovisioner" {
   source  = "commercetools-demo/demoprovisioner/commercetools"
   version = "1.0.0"
}
```

Packages of the releases are available at [the GitHub Repo](https://github.com/commercetools-demo/terraform-commercetools-demoprovisioner/releases).
See the [terraform documentation](https://www.terraform.io/docs/configuration/providers.html#third-party-plugins)
for more information about installing third-party providers.


## Using the provider
The module attempts to read the required values from a .env file as can be saved from commercetools merchant center:
- `CTP_CLIENT_ID`
- `CTP_CLIENT_SECRET`
- `CTP_PROJECT_KEY`
- `CTP_SCOPES`
- `CTP_API_URL`
- `CTP_AUTH_URL`



## Authors
This project is developed by the [commercetools](https://commercetools.com) pre-sales community. 