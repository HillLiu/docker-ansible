ARG VERSION=${VERSION:-[VERSION]}

FROM alpine:3.17

ARG VERSION

# apk
COPY ./install-packages.sh /usr/local/bin/install-packages
RUN apk update && apk add bash bc \
  && INSTALL_VERSION=$VERSION install-packages \
  && rm /usr/local/bin/install-packages

WORKDIR /app
ENV ANSIBLE_VAULT_EDITOR=vim \
  EDITOR=vim

COPY ./docker/bin/ /usr/local/bin/
COPY ./docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["server"]
