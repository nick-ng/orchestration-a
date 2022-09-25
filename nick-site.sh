#!/bin/bash

orchestration_dir=$(pwd)

cd ..

git clone https://github.com/nick-ng/nick-site.git
cd nick-site

source ./common/reset-deploy-branch.sh

docker compose -f docker-compose.prod.yml down
docker compose -f docker-compose.prod.yml build
PORT=3011 docker compose -f docker-compose.prod.yml up -d

cd $orchestration_dir
