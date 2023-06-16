#!/bin/bash

# Stop the ngrok service
sudo systemctl stop ngrok

# Disable the ngrok service
sudo systemctl disable ngrok

# Reload the systemd daemon
sudo systemctl daemon-reload

# Remove the ngrok service file
sudo rm /etc/systemd/system/ngrok.service

# Output a message indicating the completion of the uninstallation
echo "ngrok service has been uninstalled"