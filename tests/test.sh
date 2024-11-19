
# select all tables and views from sql server:

QUERY="
SELECT * FROM INFORMATION_SCHEMA.TABLES
"

docker exec -it --env-file .env db /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "$QUERY" -b
