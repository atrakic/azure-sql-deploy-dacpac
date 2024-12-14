#!/bin/bash

set -e

DB="demo"
QUERY="SELECT * FROM vSalesByCityAndCategory"

docker exec -it --env-file .env db /opt/mssql-tools/bin/sqlcmd \
    -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -d "$DB" -Q "$QUERY" -b
