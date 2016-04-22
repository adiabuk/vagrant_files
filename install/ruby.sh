#!/usr/bin/env bash
apt-add-repository -y ppa:chris-lea/node.js

apt-get update
apt-get -y install curl git-core nodejs rbenv

cat >> ~/.bashrc << EOF

export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
EOF

cp /home/vagrant/ssh/{id_rsa,id_rsa.pub,config} /home/vagrant/.ssh/

