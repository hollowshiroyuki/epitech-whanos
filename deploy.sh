#! /bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook ansible/playbook.yml -i hosts.txt --tags $@