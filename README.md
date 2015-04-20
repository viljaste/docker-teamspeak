# docker-teamspeak

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-teamspeak.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/teamspeak:latest . \
      && cd -

## License

**MIT**
