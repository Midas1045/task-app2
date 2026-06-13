#!/bin/bash

# ==============
# System hardening and Patching
# sudo apt update

# ==============
# Nginx Installation
# sudo apt install nginx -y

# ==============
# Enable Nginx after Installation
# sudo systemctl enable --now nginx

# =============
# Remove default site to avoid conflicts
sudo rm -f /etc/nginx/sites-enabled/default

# =============
# Enable my site
sudo ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/

# ===============
# Test the new Nginx
sudo nginx -t

# ===============
# Reload Nginx
sudo systemctl reload nginx
