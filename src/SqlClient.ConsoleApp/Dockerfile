FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG TARGETARCH
WORKDIR /source

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore -a $TARGETARCH

# Copy source code and publish app
COPY . ./
RUN dotnet publish -c Release -a $TARGETARCH --no-restore -o /app

# Use the official Microsoft .NET runtime image
FROM mcr.microsoft.com/dotnet/runtime:9.0 AS final
WORKDIR /app
COPY --link --from=build /app ./
ARG APP_UID=1000
USER $APP_UID
ENTRYPOINT ["./SqlClient.ConsoleApp"]
