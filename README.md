# Ngrok Installation and Uninstallation

This repository provides scripts for installing and uninstalling Ngrok, a tool for creating secure tunnels to local servers as a systemctl service

## Prerequisites

- [Ngrok](https://ngrok.com) should be downloaded and available on your system.
- Tested on Ubuntu 22.04.1 LTS

## Files

- `install_ngrok.sh`: Shell script for installing Ngrok.
- `uninstall_ngrok.sh`: Shell script for uninstalling Ngrok.
- `ngrok.yml`: Configuration file for Ngrok tunnels.

## Installation

1. Install Ngrok via APT
    ```
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
    ```

2. Git clone this repo.

3. Open a terminal and navigate to the directory containing the scripts.

4. Customize the `ngrok.yml` configuration file according to your needs.
- Authtoken
- Forwarding Port (normally 80)
- location to the script location or anywhere you want to put the log file.
```
version: "2"
authtoken: <Your authtoken here>
tunnels:
    web:
        proto: http
        addr: <forwarding port> 
    ssh:
        proto: tcp
        addr: 22
log: <full location to the cloned location>/ngrok.log
```

5. Update the `install_ngrok.sh` config location to the cloned location.
```
[Service]
ExecStart=/usr/local/bin/ngrok start --all --config=<full location to the cloned location>/ngrok.yml
```

5. Make the installation and uninstallation scripts executable by running the following command:

```chmod +x install_ngrok.sh uninstall_ngrok.sh```


6. Execute the installation script using the following command:

```sudo ./install_ngrok.sh```

This will install Ngrok as systemctl service on your system.

## Uninstallation

1. Open a terminal and navigate to the directory containing the scripts.

2. Execute the uninstallation script using the following command:

```sudo ./uninstall_ngrok.sh```

This will uninstall Ngrok from your system.

## Usage

- Ngrok should auto start every boot
- You may manually start with command : ```sudo systemctl start ngrok```
- You may manually stop ngrok with command : ```sudo systemctl stop ngrok```
- Use following command to check ngrok journal:  ```sudo journalctl -u ngrok```
- Use following command to check ngrok status: ```sudo systemctl status ngrok```
- ngrok.log for debugging, the url after started can find inside as well.


## License

This project is licensed under the [MIT License](LICENSE).

## Authors

- [@ckent-sim](https://github.com/ckent-sim)

