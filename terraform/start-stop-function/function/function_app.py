import logging
from azure.functions import AuthLevel
from azure.functions import FunctionApp
from azure.functions import HttpRequest
from azure.functions import HttpResponse
from azure.identity import DefaultAzureCredential
from azure.mgmt.containerinstance import ContainerInstanceManagementClient

SUBSCRIPTION_ID = ""
RESOURCE_GROUP_NAME = "minecraft-server"
CONTAINER_GROUP_NAME = ""
# DefaultAzureCredential() will check for env vars to use for authenticating with Azure
# Terraform will print Tenant ID and a client ID/secret
# the client ID/secret must have the permissions needed to start/stop containers (assign this manually for now)
# can't auto assign via Terraform because Entra ID restricts custom role definitions to Premium and higher SKUs

client = ContainerInstanceManagementClient(
    DefaultAzureCredential(), 
    SUBSCRIPTION_ID
)

#app = FunctionApp(http_auth_level=AuthLevel.ANONYMOUS)

#@app.route(route="start")
def start() -> HttpResponse:
    response = client.container_groups.begin_start(
        resource_group_name=RESOURCE_GROUP_NAME,
        container_group_name=CONTAINER_GROUP_NAME,
    )
    print(response)
    #logging(response)
    #return HttpResponse(response, status_code=200)

#@app.route(route="stop")
def stop() -> HttpResponse:
    response = client.container_groups.stop(
        resource_group_name=RESOURCE_GROUP_NAME,
        container_group_name=CONTAINER_GROUP_NAME,
    )
    print(response)
    #logging(response)
    #return HttpResponse(response, status_code=200)

#start()
stop()