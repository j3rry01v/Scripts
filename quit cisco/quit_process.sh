#!/bin/bash
# Environment Path: /usr/local/bin:/usr/bin:/bin
# Date Created: 2024-05-17
# Date Modified: 2024-05-17
# Author: Jerry
# Description: This script continuously monitors and kills specific Netskope client processes.
# Usage: ./kill_netskope_processes.sh

declare -a PROCESSES=("com.netskope.client.Netskope-Client.NetskopeClientMacAppProxAppProxy" "Netskope Client")

while true; do
  for process in "${PROCESSES[@]}"; do
    pkill -9 -x "$process" &> /dev/null
    if [ $? -eq 0 ]; then
      echo "Killed process: $process"
    fi
  done

  sleep 1  # Adjust sleep time as needed (1 millisecond might not be feasible, use a small value)
done
