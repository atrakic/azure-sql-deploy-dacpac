SHELL := /bin/bash

rgName?=rg-dacpac-$(shell date +'%Y%m%d%H%M%S')
administratorLogin?=$(shell whoami)
location?=northeurope

.PHONY: all status outputs test clean

all:
	az account show
	az group create --name $(rgName) --location $(location)
	az deployment group create \
		--resource-group $(rgName) \
		--template-file main.bicep \
		--parameters administratorLogin=$(adminUsername)

status:
	az resource list --resource-group $(rgName) --location $(location) --output table

outputs:
	az deployment group list --resource-group $(rgName) --query "[].properties.outputs"

test:
	az sql db list --resource-group $(rgName) --server $(serverName) --output table

clean:
	az group delete --name $(rgName)
