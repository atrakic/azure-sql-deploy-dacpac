#!/bin/bash
set -eo pipefail

dotnet build

# Publish the dacpac to the target database.
# /p:RegisterDataTierApplication=true writes DAC metadata (version, dacpac hash) into
# the target database's msdb tables. This is required for the DriftReport action used
# in CI: without registration, sqlpackage cannot determine the baseline schema and will
# immediately fail with "the database is not registered as a Data-tier Application".
sqlpackage /Action:Publish \
  /SourceFile:"${SourceFile}" \
  /TargetConnectionString:"${TargetConnectionString}" \
  /p:RegisterDataTierApplication=true

# sqlpackage /Action:DeployReport /tcs:"${TargetConnectionString}" /sf:"${SourceFile}" /op:/app/foo
