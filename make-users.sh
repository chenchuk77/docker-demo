#!/bin/bash

for user in $(cat users); do
  echo "creating user: $user"
  sudo useradd -m -p xxxx -s /bin/bash $user
  echo "$user:1234" | chpasswd
done
echo "done."
