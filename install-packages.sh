#!/usr/bin/env sh

###
# Environment ${INSTALL_VERSION} pass from Dockerfile
###

INSTALL="ansible py3-pip vim openssh-client git less jq curl"

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
addgroup mac-temp-user adm
chown root:adm -R /usr/local/share || exit 4
chmod 0775 /usr/local/share || exit 3
mkdir -p /root/.ansible/plugins/modules
pip3 install -U \
  docker \
  jmespath \
  pynetbox \
  netaddr \
  requests \
  molecule \
  'molecule[docker]' || exit 2

# Install new ansible module
ansible-galaxy collection install community.docker

apk del -f .build-deps && rm -rf /var/cache/apk/* || exit 1

exit 0
