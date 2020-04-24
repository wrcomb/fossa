#!/bin/bash

set -o errexit -o nounset -o xtrace

source ansible.sh

cd ~/fossa && ansible-playbook step.yml -K --skip-tags step3

source ~/.bashrc

cd ~/fossa && ansible-playbook step.yml -K -t step3

set +o errexit +o nounset +o xtrace