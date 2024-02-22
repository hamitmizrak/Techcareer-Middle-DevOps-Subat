
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
echo -e "\n "
read -p " $UPDATED İstiyor musunuz ? E/H " updateUserResponse
if[[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]; 
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt install –f 
else
    echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi

# PORT 
sleep 2
echo -e "\n PORT"
read -p "Port Aktif etmek ve izin Vermek istiyor musunuz ? E/H " updateUserResponse
if[[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]; 
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


# Yükleme
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Git'i Yükleme istiyor musunuz  E/H ? " installingResult
if [[ $installingResult == "E" || $installingResult == "e"  ]]
then
echo -e "Yükleme Başlandı... "
sudo apt-get install git -y
git version
git config --global user.name "hamitmizrak"
git config --global user.email "hamitmizrak@gmail.com"
git config --global -l 
sleep 1
echo -e "Bağımlılıklar Yükleniyor"
sudo apt install –f 
    
else
     echo -e "Yükleme Yapılmadı!!!\n "   
fi

# TEMİZLEME 
sleep 2
echo -e "\n TEMİZLE"
read -p "Cache yapmak istiyor musunuz ? E/H " updateUserResponse
if[[ $updateUserResponse == "E" || $updateUserResponse == "e" ]]; 
then
    echo -e "\nTemizle Başlandı... "
    sudo apt-get clean
    sudo apt-get autoremove -y
    
else
    echo -e "Temizlik Yapılmadı!!!\n "   
fi
