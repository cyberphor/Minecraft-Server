import logging
from azure.functions import AuthLevel
from azure.functions import FunctionApp
from azure.functions import HttpRequest
from azure.functions import HttpResponse
from azure.identity import DefaultAzureCredential
from azure.mgmt.containerinstance import ContainerInstanceManagementClient

SUBSCRIPTION_ID = "449b777a-56a9-4ce8-853d-7cd824d7118f"
RESOURCE_GROUP_NAME = "minecraft-server"
CONTAINER_GROUP_NAME = "causalcrab"

client = ContainerInstanceManagementClient(
    DefaultAzureCredential(), 
    SUBSCRIPTION_ID
)

app = FunctionApp()

@app.route(route="start", auth_level=AuthLevel.ANONYMOUS)
def start(req: HttpRequest) -> HttpResponse:
    response = client.container_groups.begin_start(
        resource_group_name=RESOURCE_GROUP_NAME,
        container_group_name=CONTAINER_GROUP_NAME,
    )
    print(response)
    logging(response)
    return HttpResponse(response, status_code=200)

@app.route(route="stop")
def stop(req: HttpRequest) -> HttpResponse:
    response = client.container_groups.stop(
        resource_group_name=RESOURCE_GROUP_NAME,
        container_group_name=CONTAINER_GROUP_NAME,
    )
    print(response)
    logging(response)
    return HttpResponse(response, status_code=200)