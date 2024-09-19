all:
	dotnet tool restore
	dotnet outdated --upgrade
	dotnet build

clean:
	dotnet clean
