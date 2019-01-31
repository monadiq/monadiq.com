#!/bin/bash
### Clean up when exiting
trap "exit" INT TERM ERR
trap "kill 0" EXIT

ngrok http --log=stdout 1313 > /dev/null &
NGROK_PID=$!
echo "starting ngrok ${NGROK_PID}..."
echo "waiting for ngrok to start..."
sleep 5

NGROK_URL=$(curl --silent http://localhost:4040/api/tunnels/command_line | jq '.public_url' -r)
echo "ngrok tunnel open at ${NGROK_URL}"

NGROK_BASE_URL=$(echo "${NGROK_URL}" | cut -f 3 -d '/')
hugo server --baseURL $NGROK_BASE_URL --appendPort=false
