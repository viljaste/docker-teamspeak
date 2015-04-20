#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/teamspeak/build.sh && /src/teamspeak/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/teamspeak/variables.sh && /src/teamspeak/run.sh"
    ;;
esac
