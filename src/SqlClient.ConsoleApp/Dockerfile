ARG BUILD_SDK_VERSION=9.0
ARG RUNTIME_VERSION=9.0

FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:${BUILD_SDK_VERSION} AS build
ARG TARGETARCH
WORKDIR /source

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore -a $TARGETARCH

# Copy source code and publish app
COPY . ./
RUN dotnet publish -c Release -a $TARGETARCH --no-restore -o /app


FROM mcr.microsoft.com/dotnet/runtime:${RUNTIME_VERSION} AS final
WORKDIR /app
COPY --link --from=build /app ./
ARG APP_UID=1000
USER $APP_UID
ENTRYPOINT ["./SqlClient.ConsoleApp"]
