#!/bin/bash

#This is just a helper script for setting up github. Creates RSA 4096bit public and private keys with no passphrase and makes the keys read-writable by the current user only.

echo "Generating new SSH Key pair"
if ssh-keygen -P "" -t rsa -b 4096 -m pem -f github_rsa && chmod 600 ~/.ssh/github_rsa.pub ; 
then
 echo "RSA 4096bit Private and Public keys for GitHub Created Successfully"
fi

echo "Starting SSH Agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_rsa

echo "Please add the following public key to a github account at https://github.com/settings/keys"
echo ""
cat ~/.ssh/github_rsa.pub
echo ""
echo "DONE"
