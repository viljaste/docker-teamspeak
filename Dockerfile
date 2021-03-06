FROM viljaste/base:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

VOLUME ["/teamspeak"]

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011

ENTRYPOINT ["/src/entrypoint.sh", "run"]
