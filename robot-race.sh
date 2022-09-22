#!/bin/bash

orchestration_dir=$(pwd)

cd ..

git clone https://github.com/nick-ng/robot-race.git
cd robot-race

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
PORT=3010 docker compose -f docker-compose.prod.yml up -d

cd $orchestration_dir
