#! /bin/bash
# bash (tercihiniz olsun) ancak bh eskidi
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=spring_boot_sonar \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_507e683324d96ef62259c2535dbda27496c4a98e

