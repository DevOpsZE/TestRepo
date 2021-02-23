#!/bin/bash

echo "Setting up github credentials"

git config --global user.email "decipher@abv.bg"
git config --global user.name "DevOpsZE"


echo "Creating Repo Folder and initializing Git"
mkdir -p ~/TestRepo 
cd ~/TestRepo 
git init . 

echo "Setting up remote URL"
git remote add origin git@github.com:DevOpsZE/TestRepo.git 

echo "Copying script into repository"
cp ~/test-script.sh ~/TestRepo 

git status

git add test-script.sh 

git commit -m "script added to repository" test-script.sh 

git push --set-upstream origin master

date >> ~/TestRepo/date.txt 

git add date.txt 

git commit -m "date.txt added to repository" date.txt 

git push origin master 

git checkout -b branch2 

date >> ~/TestRepo/date.txt

git diff 

git commit -m "date.txt was modified" date.txt 

git push origin branch2

echo "DONE"
