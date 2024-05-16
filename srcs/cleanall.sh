#!/bin/bash
docker rm -f $(docker ps -qa)
docker rmi $(docker images)
docker system prune -af
sudo rm -rf /home/zak/data/db/*
sudo rm -rf /home/zak/data/wp/*