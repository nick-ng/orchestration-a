#!/bin/bash

function startdocker() {
  git checkout -b temp-zz
  git branch -vv | grep -v "temp-a" | awk "{print \$1}" | xargs git branch -D
  git fetch

  origin_name=$(git remote show)
  default_branch_name=$(git remote show $origin_name | sed -n '/HEAD branch/s/.*: //p')

  git checkout $default_branch_name
  git branch -D temp-zz
  git remote prune $origin_name
  git pull
  git fetch -p
  git branch -vv | grep ": gone]" | awk "{print \$1}" | xargs git branch -D

  docker compose -f docker-compose.prod.yml build
  docker compose -f docker-compose.prod.yml up -d
}

# The way nginx and its modules work is determined in the configuration file. By default, the configuration file is named nginx.conf and placed in the directory /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx.
# cp ./nginx.conf /usr/local/nginx/conf

# nginx -s reload

cd ..

parent_dir=$(pwd)
echo $parent_dir

git clone https://github.com/nick-ng/robot-race.git
cd robot-race

ls

cd $parent_dir

ls
