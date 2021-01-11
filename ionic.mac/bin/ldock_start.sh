#!/bin/bash
lupdate_ngrok.sh
cd ~/code/appflow/ext_services
docker-compose up -d
cd ../api/
docker-compose up -d
sleep 15
cd ../nginx/
docker-compose up -d
cd ../api && docker-compose logs --follow --tail=100 | grep -v /builds/api/v4/jobs/request