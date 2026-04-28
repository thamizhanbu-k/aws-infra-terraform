#!/bin/bash
# userdata.sh — runs as root on EC2 first start

# Update and install Docker
dnf update -y
dnf install -y docker
service docker start
usermod -a -G docker ec2-user
systemctl enable docker

# Wait for Docker
sleep 10

docker network create app-network

# 1. Pull and run the Redis cache container
docker run -d \
  --name redis \
  --network app-network \
  --restart unless-stopped \
  redis:alpine

# 2. Pull and run my app from DockerHub
docker run -d \
  --name health-monitor \
  -p 8080:5000 \
  --network app-network \
  --restart unless-stopped \
  -e APP_NAME='Network Health Monitor' \
  -e APP_VERSION='2.0.0' \
  -e ENVIRONMENT='aws-ec2-asg' \
  -e REDIS_HOST='redis' \
  ${docker_image}

# Wait for app to start
sleep 20

# Log startup status
STATUS=$(curl -s -o /dev/null -w "%%{http_code}" http://localhost:8080/health)
echo "App startup status: $STATUS" >> /var/log/app-startup.log

echo 'Userdata complete' >> /var/log/app-startup.log