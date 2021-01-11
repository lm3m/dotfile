#!/bin/bash

sleep 10
curl -s \
  --connect-timeout 5 \
  --max-time 10 \
  --retry 10 \
  --retry-max-time 40 \
  http://localhost:4040/api/tunnels > $TMPDIR/tunnels.json
NGROK_URL=`jq -r '.tunnels[] | select(.name == "command_line").public_url' $TMPDIR/tunnels.json`
echo $NGROK_URL
grep -v IONIC_EXTERNAL_DEV_API_HOST ~/code/appflow/secrets.env > $TMPDIR/secrets.env
echo IONIC_EXTERNAL_DEV_API_HOST=$NGROK_URL >> $TMPDIR/secrets.env
mv $TMPDIR/secrets.env ~/code/appflow/secrets.env
