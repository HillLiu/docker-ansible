#!/usr/bin/env sh

###
# Environment ${INSTALL_VERSION} pass from Dockerfile
###

INSTALL="ansible py3-pip vim openssh-client git less"

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
mkdir -p /etc/ansible
echo 'localhost' > /etc/ansible/hosts
adduser -u 501 -D mac-temp-user
adduser -h /ansible -s /bin/bash -D ansible ansible \
  && mkdir -p /ansible
mkdir -p /ansible/.ansible/plugins/modules
pip3 install -U \
  requests \
  molecule \
  'molecule[docker]'
chown ansible:ansible -R /ansible
chmod 0777 -R /ansible
chmod 0777 -R /usr/local

apk del -f .build-deps && rm -rf /var/cache/apk/* || exit 1

exit 0
