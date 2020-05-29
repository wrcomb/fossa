#!/bin/bash

set -o errexit -o nounset -o xtrace

readonly custom_bashrc="$HOME/.bashrc_$USER"
readonly python_version="3.8.3"
readonly venv="ansible"

echo "Installing git"
sudo apt update
sudo apt install -y git

cd

if [[ -d ~/.pyenv ]]; then
  cd .pyenv
  git pull
  cd
else
  git clone https://github.com/pyenv/pyenv.git .pyenv
fi

if [[ ! -f ${custom_bashrc} ]]; then
  echo '# reading custom .bashrc' >> .bashrc
  echo ". ${custom_bashrc}" >> .bashrc
fi

touch ${custom_bashrc}
chmod 644 ${custom_bashrc}

echo '# pyenv activating'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${custom_bashrc}
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${custom_bashrc}
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ${custom_bashrc}

echo "Install dependencies"
sudo apt -y install build-essential libbz2-dev libffi-dev liblzma-dev\
  libncurses5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev\
  libxmlsec1-dev llvm tk-dev zlib1g-dev

. ${custom_bashrc}

pyenv install ${python_version}

if [[ -d ~/.pyenv/plugins/pyenv-virtualenv ]]; then
  cd .pyenv/plugins/pyenv-virtualenv
  git pull
  cd
else
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

echo '# pyenv-virtualenv activating'
echo 'eval "$(pyenv virtualenv-init -)"' >> ${custom_bashrc}
echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> ${custom_bashrc}

set +o nounset
. ${custom_bashrc}
set -o nounset

pyenv global ${python_version}
pyenv virtualenv ${venv}

set +o nounset
pyenv activate ${venv}
set -o nounset

pip install ansible
ansible --version

cp -v fossa/files/plugins/dconf.py ${PYENV_VIRTUAL_ENV}/lib/python3.8/site-packages/ansible/modules/system

set +o errexit +o nounset +o xtrace
