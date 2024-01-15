## Minecraft Server
A Minecraft server container image.

## Usage
### Docker Compose
```bash
docker compose -f docker/compose.yml up
```

### Terraform
```bash
az login
terraform -chdir=terraform init
terraform -chdir=terraform plan
terraform -chdir=terraform apply -auto-approve
```

## Copyright
This project is licensed under the terms of the [MIT license](/LICENSE).