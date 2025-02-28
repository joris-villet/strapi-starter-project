#!/bin/sh

sudo apt install yarn

chmod -R 755 /home/julek/docker/strapi-starter-project
chown -R 1000:1000 /home/julek/docker/strapi-starter-project

yarn install
yarn build
yarn develop


