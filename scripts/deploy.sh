#!/bin/bash
set -eo pipefail

dotnet build

sqlpackage /Action:Publish \
  /SourceFile:"${SourceFile}" \
  /TargetConnectionString:"${TargetConnectionString}"

# sqlpackage /Action:DeployReport /tcs:"${TargetConnectionString}" /sf:"${SourceFile}" /op:/app/foo
