# docker-teamspeak

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-teamspeak.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/teamspeak:latest . \
      && cd -

## License

**MIT**
