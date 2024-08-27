#!/bin/bash

# Script Name: viber_ads_block.sh
# Date Created: 28-03-2024
# Date Modified: 27-08-2024
# Author: Jerry
# Description: This script appends entries to the /etc/hosts file to block ad domains associated with Viber.
# Usage: Run this script as root to add ad-blocking entries for Viber to your /etc/hosts file. Usage: give executable permission to the file then sudo ./viber_ads_block.sh

entries="127.0.0.1 ads.viber.com
127.0.0.1 ads.aws.viber.com
127.0.0.1 ads-d.viber.com
127.0.0.1 s-bid.rmp.rakuten.com"

# Location of the hosts file
hosts_file="/etc/hosts"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

while IFS= read -r line; do
    if ! grep -q "^$line$" "$hosts_file"; then
        echo "$line" >> "$hosts_file"
        echo "Added $line to $hosts_file"
    else
        echo "$line already exists in $hosts_file"
    fi
done <<< "$entries"

echo "Operation completed."
