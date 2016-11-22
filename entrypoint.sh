#!/usr/bin/env bash

if [ -z "$SA_PASSWORD" ]; then
  echo "You must set SA_PASSWORD with '-e SA_PASSWORD=Your@Strong@Password' to run." >&2
  exit 1
fi

/opt/mssql/bin/sqlservr-setup --accept-eula --set-sa-password

exec sudo -E -u mssql "$@"
