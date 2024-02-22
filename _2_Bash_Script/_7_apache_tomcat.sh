#! /bin/bash
echo "APACHE TOMCAT"

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
read -p "Apache Tomcat 'i Yükleme istiyor musunuz  E/H ? " installingResult
if [[ $installingResult == "E" || $installingResult == "e"  ]]
then
echo -e "Yükleme Başlandı... "

sleep 2
sudo apt-get install wget unzip -y
sudo apt-get install wget zip -y
sudo apt install vim -y
sudo apt install net-tools

sleep 2
wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz
sudo tar xzvf apache-tomcat-10.0.8.tar.gz
sudo mkdir /opt/tomcat/
sudo mv apache-tomcat-10.0.8/* /opt/tomcat/
sudo chown -R www-data:www-data /opt/tomcat/
sudo chmod -R 755 /opt/tomcat/
    
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
