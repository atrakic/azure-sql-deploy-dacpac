FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /app

RUN set -x \
	&& dotnet tool update --global microsoft.sqlpackage

ENV PATH="${PATH}:/root/.dotnet/tools"
ENV TZ="Etc/UTC"

COPY --chmod=0755 entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
