# Ray Docker Compose

## Description

This repository contains a docker-compose file that can be used to run a Ray cluster on a single machine. The Ray cluster consists of a head node and a number of worker nodes. The head node is responsible for managing the cluster and the worker nodes are responsible for executing tasks.

## How

### 1. Install Docker and Docker Compose

- [Docker](https://docs.docker.com/get-docker/)

### 2. Clone the Repository

```
git clone
```

### 3. Copy .env.example to .env

```
cp .env.example .env
```

### 4. Modify the .env file

Modify the .env file to specify the number of worker nodes and the number of CPUs and GPUs to allocate to each worker node.

### 5. Start the Ray Cluster

with GPU support

```
docker compose -f docker-compose-gpu.yml up -d
```

cpu only

```
docker compose -f docker-compose.yml up -d
```

## run_cluster.sh

```
bash run_cluster.sh \
                  vllm/vllm-openai:latest \
                  172.18.10.125 \
                  --head \
                  ~/.cache/huggingface \
                  -e NCCL_SOCKET_IFNAME=eno1 \
                  -e GLOO_SOCKET_IFNAME=eno1
```

```
bash run_cluster.sh \
                  vllm/vllm-openai:latest \
                  172.18.10.125 \
                  --worker \
                  ~/.cache/huggingface \
                  -e NCCL_SOCKET_IFNAME=eno1 \
                  -e GLOO_SOCKET_IFNAME=eno1
```
