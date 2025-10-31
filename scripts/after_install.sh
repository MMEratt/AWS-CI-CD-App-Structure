#!/bin/bash
set -e
echo ">>> Running after_install.sh"
sudo cp -r /tmp/deployment-archive/app/* /var/www/html/
sudo chown -R nginx:nginx /var/www/html || true
