#! /bin/bash

sleep 2
echo -e "\n######  DSonarQube  ######"

mvn clean verify sonar:sonar \
  -Dsonar.projectKey=java_test \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_646728a6d27a4dd5dd4fd9b3d6a91f3d469f05e1