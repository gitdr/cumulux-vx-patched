#!/bin/bash

set -e

PACKER_LOG=1 packer build -on-error=abort packer.json 2>&1 | tee packer_buildlog
vagrant box add metadata.json --force 2>&1 | tee image_add_log
rm -rf output-vagrant
