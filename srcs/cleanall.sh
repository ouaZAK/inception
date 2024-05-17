#!/bin/bash
docker rm -f $(docker ps -qa)
docker rmi $(docker images)
docker system prune -af
sudo rm -rf /home/zouaraqa/data/db/*
sudo rm -rf /home/zouaraqa/data/wp/*