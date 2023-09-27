#!/bin/bash 
warp-svc &
sleep 2
warp-cli --accept-tos register
warp-cli set-proxy-port 40001
warp-cli set-mode proxy

if [[ -n $WARP_LICENSE ]]; then
  warp-cli set-license "${WARP_LICENSE}"
fi
warp-cli connect

socat tcp-listen:40000,reuseaddr,fork tcp:localhost:40001