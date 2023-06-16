#!/bin/bash

# Create the ngrok.service file
sudo tee /etc/systemd/system/ngrok.service > /dev/null <<EOF
[Unit]
Description=ngrok tunneling service
After=network.target

[Service]
ExecStart=/usr/local/bin/ngrok start --all --config=<full location to the cloned location>/ngrok.yml
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload the systemd daemon
sudo systemctl daemon-reload

# Enable the ngrok service
sudo systemctl enable ngrok

# Start the ngrok service
sudo systemctl start ngrok