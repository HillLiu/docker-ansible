#!/usr/bin/env sh

###
# Environment ${INSTALL_VERSION} pass from Dockerfile
###

INSTALL="ansible vim"

BUILD_DEPS=""

echo "###"
echo "# Will install"
echo "###"
echo ""
echo $INSTALL
echo ""
echo "###"
echo "# Will install build tool"
echo "###"
echo ""
echo $BUILD_DEPS
echo ""

apk add --virtual .build-deps $BUILD_DEPS && apk add $INSTALL

#/* put your install code here */#
groupadd --gid 1000 ansible && \
    useradd --home-dir /ansible --shell /bin/bash --uid 1000 --gid 1000 ansible && \
    mkdir -p /ansible
chmod 0777 /ansible

apk del -f .build-deps && rm -rf /var/cache/apk/* || exit 1

exit 0
