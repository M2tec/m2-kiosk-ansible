#!/bin/bash

set -x

ansible-playbook -i prod playbook-update-packages-direct.yaml
