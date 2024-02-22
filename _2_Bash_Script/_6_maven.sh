#! /bin/bash
echo "MAVEN"


# User Variable
UPDATED="Güncelleme"
CLEANER="Temizleme"
INSTALL="Yükleme"
DELETED="Silme"
WHICH="Nerede ?"
COMMONINFORMATION=" Genel Bilgiler"

# System Variable

# Updated
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Güncelleme istiyor musunuz  E/H ? " updatedResult
if [[ $updatedResult == "E" || $updatedResult == "e"  ]]
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudo  apt-get upgrade -y
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

# Maven deleted
sleep 2
read -p "Maven Silmek istiyor musunuz  E/H ? " deletedResult
if [[ $deletedResult == "E" || $deletedResult == "e"  ]]
then
    echo -e "Güncelleme Başlandı... "  
    echo -e "Temizlik Başlandı... "
    sudo apt-get clean
    sudo apt-get autoremove -y
    sudo apt-get purge maven
    sudo apt-get purge maven
    sudo rm -f apache-maven-3.6.3-bin.tar.gz
    sudo apt-get update && sudo  apt-get upgrade -y
else
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi

# MAVEN
sleep 2
echo   -e "\n###### MAVEN ######"
read -p "MAVEN Yükleme istiyor musunuz? E / H " installingResult
if [[ $installingResult == "E"  ||  $installingResult == "e" ]]
then
	# Java
	echo   -e "\n###### MAVEN"  $INSTALL "######"
	echo   -e "\n######"  $WHICH "######"
     which maven
	which java
	which git
	sudo apt-get update
     echo   -e "\n###### JAVA VERSION ######"
	java --version
     javac --version
     #sudo su

     sudo apt install maven
     sleep 1
     echo -e "Bağımlılıklar Yükleniyor"
     sudo apt install –f 
     #cd /usr/local 
     #sudo wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
     #sudo tar xzf apache-maven-3.6.3-bin.tar.gz 
     #sudo ln -s apache-maven-3.6.3 maven
     #JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
     #M2_HOME=/usr/local/maven
     #MAVEN_HOME=/usr/local/maven
     #PATH=${M2_HOME}/bin:${PATH}
     #sudo rm -rf /etc/profile.d/maven.sh
	 ### echo -e "#Java Home\nJAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64/bin/\" " >> ~/.bashrc 
     #echo -e "#Maven Home\n export" ${JAVA_HOME}\n" | sudo tee --append /etc/profile.d/maven.sh
     #echo -e "export" ${M2_HOME}\n" | sudo tee --append /etc/profile.d/maven.sh
     #echo -e "export" ${MAVEN_HOME}\n" | sudo tee --append /etc/profile.d/maven.sh
     #echo -e "export" ${PATH}\n" | sudo tee --append /etc/profile.d/maven.sh
     #sudo source /etc/profile.d/maven.sh
     echo   -e "\n###### MAVEN VERSION ######"
     mvn -version
else 
    echo -e "Maven Güncelleme Yapılmadı!!!\n "
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