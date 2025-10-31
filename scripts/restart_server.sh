#!/bin/bash
set -e
echo ">>> Restarting Nginx..."
sudo systemctl enable nginx || true
sudo systemctl restart nginx || sudo systemctl start nginx
