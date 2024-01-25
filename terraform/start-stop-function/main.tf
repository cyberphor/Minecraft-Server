data "azurerm_client_config" "main" {}

resource "random_pet" "value" {
  length    = 2
  separator = ""
}

resource "azurerm_resource_group" "main" {
  name     = random_pet.value.id
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = random_pet.value.id
  location                 = azurerm_resource_group.main.location
  resource_group_name      = azurerm_resource_group.main.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azuread_application" "container_group" {
  display_name = "minecraft-server-container-group-operator"
}

resource "azuread_service_principal" "container_group" {
  application_id = azuread_application.container_group.application_id
}
 
resource "azuread_service_principal_password" "container_group" {
  service_principal_id = azuread_application.container_group.application_id
}

resource "azurerm_role_assignment" "container_group" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = azuread_application.container_group.application_id
}

resource "azurerm_service_plan" "main" {
  name                = random_pet.value.id
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "S1" # Y1 = Consumption Plan
}

data "archive_file" "main" {
  type        = "zip"
  source_dir  = "${path.root}/function"
  output_path = "${path.root}/function.zip"
}

resource "azurerm_linux_function_app" "main" {
  depends_on = [ data.archive_file.main ]
  name                        = random_pet.value.id
  resource_group_name         = azurerm_resource_group.main.name
  location                    = var.location
  service_plan_id             = azurerm_service_plan.main.id
  storage_account_name        = azurerm_storage_account.main.name
  storage_account_access_key  = azurerm_storage_account.main.primary_access_key
  https_only                  = true
  functions_extension_version = "~4"
  app_settings = {
    "ENABLE_ORYX_BUILD"              = "true"                # enable on-the-fly builds
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"                # enable on-the-fly builds
    "FUNCTIONS_WORKER_RUNTIME"       = "python"
    "AzureWebJobsFeatureFlags"       = "EnableWorkerIndexing"
  }
  site_config {
    always_on = true
    application_stack {
      python_version = "3.11"
    }
  }
  zip_deploy_file = data.archive_file.main.output_path
}

# https://github.com/hcodebase/tfazurefun/