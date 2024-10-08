# azure-sql-deploy-dacpac

[![license](https://img.shields.io/github/license/atrakic/azure-sql-deploy-dacpac.svg)](https://github.com/atrakic/azure-sql-deploy-dacpac/blob/main/LICENSE)
[![ci](https://github.com/atrakic/azure-sql-deploy-dacpac/actions/workflows/ci.yml/badge.svg)](https://github.com/atrakic/azure-sql-deploy-dacpac/actions/workflows/ci.yml)

## Overview

> This project demonstrates how to deploy a [dacpac](https://learn.microsoft.com/en-us/sql/relational-databases/data-tier-applications/data-tier-applications?view=sql-server-ver16) to an Azure SQL Database using a GitHub Action.

## Prerequisites
- Azure Subscription


## Setup
1. Create a new Azure SQL Database
2. Create a new Azure Service Principal
> See infra [README.md](../infra/README.md) for more details.

## Configuration
1. Add the following secrets to your GitHub repository:
    - `AZURE_SQL_CONNECTION_STRING` - Azure SQL Database connection string

## Azure Deployment
See [deploy.yml](.github/workflows/deploy.yml)


## Resources
- https://github.com/microsoft/DacFx?tab=readme-ov-file#-create-a-sql-project
- https://learn.microsoft.com/en-gb/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver16
- https://learn.microsoft.com/en-us/sql/relational-databases/data-tier-applications/data-tier-applications?view=sql-server-ver16
- https://www.nuget.org/packages/microsoft.build.sql/
