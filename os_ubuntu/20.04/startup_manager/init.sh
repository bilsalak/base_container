#! /bin/bash

# Pull in list of processes to boot from config file
source /etc/startup_manager.conf

# Run commands and exit if anything fails to start
for COMMAND in "${COMMANDS[@]}"; do
  $COMMAND
  status=$?
  if [ $status -ne 0 ]; then
    echo "Failed to start '$COMMAND' with exit code : $status"
    exit $status
  fi
done

# Loop forever until a health check fails
while /bin/true; do

  for CHECK in "${CHECKS[@]}"; do
    ps -ef | grep "$CHECK" | grep -q -v grep
    status=$?
    if [ $status -ne 0 ]; then
      echo "The '$COMMAND' health check failed in startup_manager/init.sh"
      exit $status
    fi
  done

  sleep 60
done