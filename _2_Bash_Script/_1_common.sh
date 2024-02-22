#! /bin/bash

# Shell çalıştırmak
# ./_1_common.sh

# User Variable
UPDATED="Güncelleme"
NOT_UPDATED="Güncellenmedi"
CLEANER="Temizleme"
INSTALL="Yükleme"
NOT_INSTALLED="Yüklenmedi"
DELETED="Silme"
COMMON_INFORMATION="Genel Bilgiler"
ERROR="Hata"
WARNING="Uyarı"
SUCCESS="Başarılı"
FAILED="Başarısız"
NOT_FOUND="Bulunamadı"
CHMOD="Dosya İzinleri Vermek"

# Güncelleme 
sleep 2
echo -e "\n $UPDATED "
read -p "Güncelleme İstiyor musunuz ? E/H " updateUserResponse
if [[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudo apt-get upgrade -y
else
    echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi


# Dosya İzinleri ver
sleep 2
echo -e "\n DOSYA IZINLERI"
read -p "Dosyalara izin vermek istiyor musunuz E/H " chmodUserResponse
if [[ $chmodUserResponse == "E" || $chmodUserResponse == "e" ]]
then
    echo -e "\n Dosya İzinleri Yetkilendirilmeleri Veriliyor"
    sleep 1
    # chmod -R 777 /var/www/html
    sudo chmod +x _1_common.sh
    sudo chmod +x _2_git.sh
    sudo chmod +x _3_vs_code.sh
    sudo chmod +x _4_nodejs.sh
    sudo chmod +x _5_jdk.sh
    sudo chmod +x _6_maven.sh
    sudo chmod +x _7_apache_tomcat.sh
    sudo chmod +x _8_docker.sh
    sudo chmod +x _9_postgresql.sh
    sudo chmod +x _10_sonarQube.sh
    sudo chmod +x _14_AllVersion.sh
    echo -e "\n Dosya İzinleri Verildi"
else
    echo -e "\n Dosya İzinleri Verilmedi"
fi

# Genel Bilgiler
sleep 2
echo -e "\n GENEL BILGILER"
read -p "Genel Bilgiler istiyor musunuz  E/H ? " commonResult
if [[ $commonResult == "E" || $commonResult == "e"  ]]
then
    echo -e "Genel Bilgiler Başlandı... " 

    sleep 1
    echo -e "Ben Kimim ... " 
    sudo whoami

    sleep 1
    echo -e "Linux Dağıtımı Bilgileri ... "  
    sudo lsb_release -a

    sleep 1
    echo -e "Disk alanım. "  
    sudo df -m

    sleep 1
    echo -e "IP ... " 
    sudo ifconfig

    sleep 1
    echo -e "Portlar ... " 
    sudo netstat -nlptu

    sleep 1
    echo -e "Ram ... " 
    sudo free -m

    sleep 1
    echo -e "Cpu ... " 
    sudo cat /proc/cpuinfo
else
    echo -e "Genel Bilgiler Gösterilmediı!!!\n "    
fi


# Yükleme
sleep 2
echo -e "\n GENEL YÜKLEME"
read -p "Genel Yükleme Yapmak İstiyor musunuz  E/H ? " commonResult
if [[ $commonResult == "E" || $commonResult == "e"  ]]
then
    echo -e "Genel Yükleme Bilgileri Başlandı... " 

    sleep 1
    pwd
    echo -e "Genel yükleme başlıyor ... "
    sudo apt-get install -y net-tools
    sudo apt-get install -y openssh-server 
    sudo apt-get install -y curl
    sudo apt-get install -y wget
    sudo apt-get install -y git
    sudo apt-get install -y vim
    sudo apt-get install -y nano
    sudo apt-get install -y zip
    sudo apt-get install -y unzip
    sudo apt-get install -y tar
    sudo apt-get install -y gzip
    sudo apt-get install -y bzip2
    sudo apt-get install -y rar
    sudo apt-get install -y unrar
else
    echo -e "Genel Bilgiler Gösterilmediı!!!\n "    
fi


# PORT 
sleep 2
echo -e "\n PORT"
read -p "Port Aktif etmek ve izin Vermek istiyor musunuz ? E/H " updateUserResponse
if [[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]
then
    echo -e "Port İşlemlerine Başlandı... "  
    sudo netstat -nlptu
    sudo ufw allow 22
    sudo ufw allow 80
    sudo ufw allow 443
    sudo ufw allow 1111
    sudo ufw allow 2222
    sudo ufw allow 3333
    sudo ufw allow 4444
    sudo ufw allow 8080
    sudo ufw allow 8000
    sudo ufw allow 9000
    sudo ufw allow 3306
    sudo ufw allow 5432
else
    echo -e "Port Güncelleme Yapılmadı!!!\n "   
fi

# TEMİZLEME 
sleep 2
echo -e "\n TEMİZLE"
read -p "Cache yapmak istiyor musunuz ? E/H " updateUserResponse
if [[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]
then
    echo -e "\nTemizle Başlandı... "
    sudo apt-get clean
    sudo apt-get autoremove -y
    
else
    echo -e "Temizlik Yapılmadı!!!\n "   
fi