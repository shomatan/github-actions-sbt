#!/bin/sh
set -eu

SBT_VERSION=$1

if [[ -z "$SBT_VERSION" ]]; then
  echo "SBT_VERSION not set."
  exit 1
fi

wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar xz -C $SBT_HOME --strip-components=1