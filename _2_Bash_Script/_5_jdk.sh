#! /bin/bash
echo "JAVA JDK"

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
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi


# JAVA
sleep 2
echo   -e "\n###### JAVA ######"
read -p "JAVA Yükleme istiyor musunuz? E / H ? " installingResult
if [[ $installingResult == "E"  ||  $installingResult == "e" ]]
then
	# Java
	echo   -e "\n###### JAVA"  $INSTALL "######"
	echo   -e "\n######"  $WHICH "######"
	which java
	which git
	sudo apt-get update
	java --version
     javac --version
	sudo apt install openjdk-11-jdk -y
	sudo add-apt-repository ppa:openjdk-r/ppa -y
	# JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"             
	# vim deneme2.sh  #-s <(echo -e "/foo/\ndd\n:wq")
	echo -e "#Java Home\nJAVA_HOME=\"/usr/lib/jvm/java-11-openjdk-amd64/bin/\" " >> ~/.bashrc 
	# sudo apt-get update
    #sudo apt-get upgrade -y

    #sudo apt-get install wget unzip -y
    #sudo apt-get install openjdk-17-jdk -y
    #sudo apt-get install openjdk-17-jre -y
    #sudo update-alternatives --config java
    #java -version
 

     echo $JAVA_HOME
	# java version
	echo   -e "\n######"  "java" $VERSION  "######"
	java -version
     javac -version
     sleep 1
     echo -e "Bağımlılıklar Yükleniyor"
     sudo apt install –f 
else 
    echo -e "Java Güncelleme Yapılmadı!!!\n "    
fi 


#  Silme
sleep 2
echo -e "\n### ${DELETED} ###"
echo -e "\nJava'yı Silmek istiyor musunuz ? E/H " deletedResult
if [[ $deletedResult == "E" || $deletedResult == "e"  ]]
then
    echo -e "Temizlik Başlandı... "
    sudo update-alternatives --remove "java" "/usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/java"    
    sudo update-alternatives --remove "javac" "/usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/javac"    
    sudo update-alternatives --remove "javaws" "/usr/lib/jvm/java-1.11.0-openjdk-amd64/bin/javaws"
    sudo rm -r /usr/lib/jvm/
    sudo apt-get clean
    sudo apt-get autoremove -y
else
     echo -e "Java Silme Yapılmadı!!!\n "   
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
    java --version
else 
    echo -e "Temizlik Yapılmadı!!!\n "    
fi


sleep 2
echo -e "\n######  BİTTİ ######"
