#!/bin/bash

NODE_IP_ADDRESS=${NODE_IP_ADDRESS}
if [ "$IS_RAY_HEAD" = true ]; then
  echo "Starting Ray head node..."
  ray start --head --disable-usage-stats --node-manager-port 12345 \
   --dashboard-agent-grpc-port 50052 --dashboard-agent-listen-port 52365 \
   --metrics-export-port 8090  --object-manager-port 12346 \
   --min-worker-port 20000 --max-worker-port 20100 \
   --dashboard-host 0.0.0.0 \
   --node-ip-address=$NODE_IP_ADDRESS  --disable-usage-stats --block
else
  if [ -z "$RAY_HEAD_IP" ]; then
    echo "Error: RAY_HEAD_IP must be specified for worker nodes."
    exit 1
  fi
  echo "Starting Ray worker node connecting to head at ${RAY_HEAD_IP}:6379..."
  ray start --disable-usage-stats --node-manager-port 12345 \
   --dashboard-agent-grpc-port 50052 --dashboard-agent-listen-port 52365 \
   --metrics-export-port 8090  --object-manager-port 12346 \
   --min-worker-port 20000 --max-worker-port 20100 \
   --address="$RAY_HEAD_IP:6379" --node-ip-address=$NODE_IP_ADDRESS --block
fi