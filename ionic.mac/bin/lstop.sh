#!/bin/bash

cd ~/code/appflow/nginx
docker-compose down
cd ../api/
docker-compose down
cd ../ext_services/
docker-compose down

