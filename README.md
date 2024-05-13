## Minecraft Server
A Minecraft server container image.

## Usage
### Docker Compose
```bash
docker compose -f docker/compose.yml up --build
```

### Terraform
```bash
az login
az account set --subscription "Personal"
terraform -chdir=terraform init
terraform -chdir=terraform plan
terraform -chdir=terraform apply
```

## Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).