#! /bin/bash
echo "POSTGRESQL"

# User Variable
UPDATED="Güncelleme"
CLEANER="Temizleme"
INSTALL="Yükleme"
DELETED="Silme"
WHICH="Nerede ?"
VERSION=Version
COMMONINFORMATION="Genel Bilgiler"

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
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n"
fi

# Silmek
sleep 2
echo -e "\n### Postgresql Silmek ###"
read -p "Postgresql Silmek istiyor musunuz E/H ? " deletedResult
if [[ $deletedResult == "E" || $deletedResult == "e"  ]]
then
    echo -e "Postgresql Başlandı... "
    sudo apt remove postgresql postgresql-contrib -y
    sudo apt autoremove -y
    dpkg -l |grep postgres;
    sudo apt-get –purge remove postgresql postgresql-14 postgresql-client-common postgresql-common postgresql-contrib
    dpkg -l | grep postgres
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
read -p "Postgresql'i Yükleme istiyor musunuz  E/H ? " installingResult
if [[ $installingResult == "E" || $installingResult == "e"  ]]
then
echo -e "Yükleme Başlandı... "

sleep 2
sudo apt-get install wget unzip -y
sudo apt-get install wget zip -y
sudo apt install vim -y
sudo apt install net-tools
sudo ufw allow 5432

sleep 2
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
echo -e "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main " | sudo tee --append /etc/apt/sources.list.d/pgdg.list
sudo wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get -y install postgresql postgresql-contrib

sleep 2
echo -e "######Postgresql Enable"
sudo systemctl enable postgresql

sleep 2
echo -e "Postgresql Start"
sudo systemctl start postgresql

#sudo systemctl status postgresql

echo -e "Postgresql yeni şifre: sonarqube yapalım"
# yeni şifre: sonarqube
sudo passwd postgres
su - postgres
createuser sonar
psql
ALTER USER sonar WITH ENCRYPTED password 'sonar';
CREATE DATABASE sonarqube OWNER sonar;
grant all privileges on DATABASE sonarqube to sonar;
\q
exit

sleep 2
echo -e "Bağımlılıklar Yükleniyor"
sudo apt install –f 

sleep 2
echo -e "5432 PORT"
sudo netstat -ntlp | grep 5432
sudo netstat -nlptu
    
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
