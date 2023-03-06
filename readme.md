# terraform-commercetools-demoprovisioner



This is a project to very quickly start a demo environment from a vanilla setup.

Just add countries, languages and currencies in the ```ct-config.yml``` file and this terraform module creates:
- supply channels
- distribution channels
- stores
- tax categories and tax rates
- product-selections
- etc and to be determined

```
Version information: 0.0.5
```

### dependencies:


- ```.env``` file with:
```
CTP_PROJECT_KEY=<commercetools project key>
CTP_CLIENT_SECRET=<your client secret>
CTP_CLIENT_ID=<your client id>
CTP_AUTH_URL=<auth url>
CTP_API_URL=<api url>
CTP_SCOPES=<scopes>
```

- ```ct_config.yml``` the script file to configure the environment