#! /bin/bash

# updated
sudo apt-get update
sudo apt-get install unzip wget nodejs

# install
sudo mkdir /downloads/sonarqube -p
sudo cd /downloads/sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
sudo unzip sonar-scanner-cli-4.2.0.1873-linux.zip
sudo mv sonar-scanner-4.2.0.1873-linux /opt/sonar-scanner

# propertes file
sudo vim /opt/sonar-scanner/conf/sonar-scanner.properties
    sonar.host.url=http://localhost:9000
    sonar.sourceEncoding=UTF-8

# environment variables configuration
sudo vim /etc/profile.d/sonar-scanner.sh
    #/bin/bash
    export PATH="$PATH:/opt/sonar-scanner/bin"

# reboot machine
sudo reboot

# source
sudo source /etc/profile.d/sonar-scanner.sh