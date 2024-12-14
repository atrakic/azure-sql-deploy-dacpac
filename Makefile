
.PHONY: docker build clean

docker:
	docker compose up --build --force-recreate --remove-orphans -d

build:
	dotnet tool restore
	dotnet outdated --upgrade
	dotnet build

test:
	#dotnet test
	./tests/test.sh

clean:
	dotnet clean
	docker compose down --remove-orphans --volumes
