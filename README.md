# azure-sql-deploy-dacpac

[![license](https://img.shields.io/github/license/atrakic/azure-sql-deploy-dacpac.svg)](https://github.com/atrakic/azure-sql-deploy-dacpac/blob/main/LICENSE)
[![ci](https://github.com/atrakic/azure-sql-deploy-dacpac/actions/workflows/ci.yml/badge.svg)](https://github.com/atrakic/azure-sql-deploy-dacpac/actions/workflows/ci.yml)

## Overview

> This project demonstrates how to automate tests with 'microsoft.sqlpackage' using a GitHub Actions & Docker.


## Flow

1. Build SQL server objects (tables, views, and instance objects)
2. Dacpack file is created
3. Contents of dacpac is consumed by Github Actions
4. Deploy against a SQL database


## Deployment prerequisites
- Azure Subscription

## Setup
1. Create a new Azure Service Principal
2. Create a new Azure SQL Database, see [Makefile](./infra/Makefile) for more details.

## Configuration
1. Add the following secrets to your GitHub repository:
    - `AZURE_SQL_CONNECTION_STRING` - Azure SQL Database connection string of your database

## Azure Deployment
1. Run database deployment from github actions tab. See [deploy.yml](.github/workflows/deploy.yml)


## Local development environment
To run sql project in Docker, follow these steps:

1. Build and start the necessary containers
```bash
make docker
```

2. Examine the logs
```bash
docker compose logs -f
```
