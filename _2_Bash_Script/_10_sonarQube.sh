#! /bin/bash
echo "SonarQube Yüklerken bunlara dikkat et"
sleep 2
echo -e "Ubuntu 22.04 LTS with minimum 2GB RAM and 1 CPU."
sleep 2
echo -e "PostgreSQL Version 9.3 or higher."
sleep 2
echo -e "SSH access with sudo privileges"
sleep 2
echo -e "Firewall Port: 9000 yapmalısın"




# User Variable
UPDATED="Güncelleme"
CLEANER="Temizleme"
INSTALL="Yükleme"
DELETED="Silme"
WHICH="Nerede ?"
VERSION=Version
COMMONINFORMATION=" Genel Bilgiler"

# System Variable

# Updated
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Güncelleme istiyor musunuz  E/H ? " updatedResult
if [[ $updatedResult == "E" || $updatedResult == "e"  ]]
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudo apt-get upgrade -y
else
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi


# Common
sleep 2
echo -e "\n### ${COMMONINFORMATION} ###"
read -p "Genel Bilgiler istiyor musunuz  E/H ? " commonResult
if [[ $commonResult == "E" || $commonResult == "e"  ]]
then
    echo -e "Genel Bilgiler Başlandı... "  
    echo -e "Ben Kimim ... "  
    sudo whoami
    echo -e "IP ... " 
    sudo ifconfig
    echo -e "Portlar ... " 
    sudo netstat -nlptu
    echo -e "Ram ... " 
    sudo free -m
else
     echo -e "Genel Bilgiler Gösterilmediı!!!\n "    
fi

# Yükleme
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "SonarQube'i Yükleme istiyor musunuz  E/H ? " installingResult
if [[ $installingResult == "E" || $installingResult == "e"  ]]
then
echo -e "###### Yükleme Başlandı... ###### "
sudo ufw allow 9000

sleep 2
sudo sysctl -w vm.max_map_count=524288
sudo sysctl -w fs.file-max=131072
sudo ulimit -n 131072
sudo ulimit -u 8192
sudo ufw allow 9000

sleep 2
#echo -e "#SonarQube Home\nsonarqube   -   nofile   65536\nsonarqube   -   nproc    4096  " >> /etc/security/limits.conf
echo -e "#SonarQube Home\nsonarqube   -   nofile   65536\nsonarqube   -   nproc    4096  " | sudo tee --append /etc/security/limits.conf

cd /tmp
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
sudo unzip sonarqube-9.9.0.65466.zip -d /opt
sudo mv /opt/sonarqube-9.9.0.65466 /opt/sonarqube
sudo groupadd sonar
sudo useradd -c "user to run SonarQube" -d /opt/sonarqube -g sonar sonar 
sudo chown sonar:sonar /opt/sonarqube -R
echo -e "### Sonar Config Yükleme Başlandı... "
echo -e "#SonarQube Config" | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "sonar.jdbc.username=sonar" | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "sonar.jdbc.password=sonarqube" | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube" | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "sonar.web.port=9000 " | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "#sonar.web.host=127.0.0.1 " | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "#sonar.web.context=/sonar" | sudo tee --append /opt/sonarqube/conf/sonar.properties
echo -e "RUN_AS_USER=sonar" | sudo tee --append /opt/sonarqube/bin/linux-x86-64/sonar.sh

echo -e "#my special Sonar" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "[Unit]" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "Description=SonarQube service" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "After=syslog.target network.target" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "[Service]" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "Type=forking" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "User=sonar" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "Group=sonar" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "Restart=always" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "LimitNOFILE=65536" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "LimitNPROC=4096" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "[Install]" | sudo tee --append /etc/systemd/system/sonar.service
echo -e "WantedBy=multi-user.target" | sudo tee --append /etc/systemd/system/sonar.service


echo -e "Bağımlılıklar Yükleniyor"
sudo apt install –f 

echo -e "### Sudo su sonar başladı... ################################ "
# sudo su sonar
# echo -e "./sonar.sh start" | sudo tee --append /opt/sonarqube/bin/linux-x86-64
# echo -e "./sonar.sh status" | sudo tee --append /opt/sonarqube/bin/linux-x86-64
# echo -e "tail" | sudo tee --append /opt/sonarqube/logs/sonar.log
# echo -e "./sonar.sh stop" | sudo tee --append /opt/sonarqube/bin/linux-x86-64
# exit
sudo su sonar
cd /opt/sonarqube/bin/linux-x86-64/
./sonar.sh start
./sonar.sh status
tail /opt/sonarqube/logs/sonar.log
cd /opt/sonarqube/bin/linux-x86-64/
./sonar.sh stop
exit

# bunu yazmazsan çalışmaz
sudo sysctl -w vm.max_map_count=262144
sysctl vm.max_map_count
sudo netstat -ntlp | grep 9000
#journalctl -u sonar

echo -e "### systemctl daemon-reload ################################ "
sudo systemctl daemon-reload
sudo systemctl enable sonar
sudo systemctl start sonar
sudo systemctl restart sonar
else
     echo -e "Yükleme Yapılmadı!!!\n "   
fi

# Temizlik
sleep 2
echo -e "\n######  Cache Temizleme  ######"
read -p  "Cache Temizleme istiyor musunuz? E / H " cleanResult
if [[ $cleanResult == "E"  ||  $cleanResult == "e" ]]
then
	echo   -e "\n######"  $CLEANER "######"
	echo -e "Temizlik Başlandı... "  
    sudo apt-get clean
    sudo apt-get autoremove -y
else 
    echo -e "Temizlik Yapılmadı!!!\n "    
fi


sleep 2
echo -e "\n######  BİTTİ ######"
