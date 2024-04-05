#!/bin/bash
CONTAINER_NAME="my-node-container"
if docker ps -a --format
'{{.Names}}'|grep -q "^$
{CONTAINER_NAME}$"; then 
	echo "stopping and removing existing container.."
	docker stop ${CONTAINER_NAME}
fi

echo "building docker image.."
docker build -t my-node-app .

echo "running docekr container.."
docker run -d -p 3000:3000 --name ${CONTAINER_NAME} my-node-app

echo "running containers"
docker ps
echo "available images"
docker images
