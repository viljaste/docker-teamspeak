#!/usr/bin/env bash

shopt -s nullglob

WORKING_DIR="$(pwd)"

hash docker 2> /dev/null

if [ "${?}" -ne 0 ]; then
  echo "teamspeakdata: docker command not found."

  exit 1
fi

help() {
  cat << EOF
teamspeakdata: Usage: teamspeakdata <backup|restore>
EOF

  exit 1
}

if [ "${1}" == "-h" ] || [ "${1}" == "--help" ]; then
  help
fi

unknown_command() {
  echo "teamspeakdata: Unknown command. See 'teamspeakdata --help'"

  exit 1
}

if [ -z "${1}" ]; then
  unknown_command
fi

teamspeakdata_containers() {
  echo "$(docker ps -a | grep teamspeakdata | awk '{ print $1 }')"
}

if [ "${1}" = "backup" ]; then
  CONTAINERS="$(teamspeakdata_containers)"

  if [ -n "${CONTAINERS}" ]; then
    for CONTAINER in ${CONTAINERS}; do
      CONTAINER_NAME="$(docker inspect --format='{{.Name}}' ${CONTAINER} | cut -c 2-)"

      docker run \
        --rm \
        --volumes-from "${CONTAINER}" \
        -v "${WORKING_DIR}:/backup" \
        viljaste/base:latest tar czvf "/backup/${CONTAINER_NAME}.tar.gz" /teamspeak
    done
  fi
elif [ "${1}" = "restore" ]; then
  for FILE in *.tar.gz; do
    CONTAINER="${FILE%%.*}"

    docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /teamspeak \
      viljaste/data:latest

    docker run \
      --rm \
      --volumes-from "${CONTAINER}" \
      -v "${WORKING_DIR}:/backup" \
      viljaste/base:latest tar xzvf "/backup/${CONTAINER}.tar.gz"
  done
else
  unknown_command
fi
