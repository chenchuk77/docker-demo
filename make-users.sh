#!/bin/bash

#
# This scripts create users with 1234 as password, use for testing only !.
# it must run as root
#
# usage:
# $ ./make-users.sh avi eli ran
#

for user in "$@"; do
  echo "creating user: $user"
  sudo useradd -m -p xxxx -s /bin/bash $user
  echo "$user:1234" | chpasswd
  usermod -aG sudo $user
  usermod -aG docker $user
done
echo "done."
