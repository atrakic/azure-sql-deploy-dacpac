
.PHONY: all docker clean

all:
	dotnet tool restore
	dotnet outdated --upgrade
	dotnet build

docker:
	docker compose up --build --force-recreate --remove-orphans -d

clean:
	dotnet clean
	docker compose down --remove-orphans --volumes
