İşletim Sistemi = Donanım+Yazılım

İşletim Sistemi yapıları = Kernel(Çekirdek) + Shell(Kabuk)
Shell(Kabuk) = Kullanıcıdan gelen istekleri (Request) , kernel(Çekirdeğe) iletiyor.
Kernel(Çekirdek): Yazılım + Donanım arasındaki haberleşmeyi sağlıyor.
End user(Son kullanıcı) Client

Shell 
bash ( Bourne Again Shell ) : Linux Default gelen kabuttur. 
sh

-------------------------------------------------------------------------

Port 
2^16= 65536 port
0 <= PORT <= 1023 (Well-Know Port)
0   => 
20  => FTP (File Transfer Protocol)
22  => SSH
23  => Telnet 
80  => Http Reverse Proxy (nginx)
80  => Http Reverse Proxy (docker)
443 => Https SSL


1024 <= PORT <= 49151 (Registed Port)
3306  => Mysql
5432  => Postgresql
6379  => Redis
27017 => Mongo
3000  => Node js + React JS


49152<= PORT <= 65535 ( Dynamics Port)
sudo ufw status (inactive)
sudo ufw enable
sudo ufw allow 22
sudo -nlptu
sudo netstat -nlptu


-------------------------------------------------------------------------

Linux, Ubuntu,  Centos
Linux: 1990 Linus Torvalds yazıldı.
Linux ücretsiz 
Unix  ücretli
Ubuntu = Linux dağıtımlarından en popüler olanıdır.
Canonical Company sağlanıyor.
GNU : Gnu is Not Unit
GPL : Free as In Freedom (GNU General Public Lisans)
GPL Temel Özgürlük İlkesi
programı sınırsız kullan.
programı inceleme, değiştirme.
programı kopyalama.
programı dağıt.


-------------------------------------------------------------------------

Ubuntu;
Ubuntu: Güney Afrika dilinde Başka nesneler saygıdır.
bir linux dağıtımıdır.
İşletim sistemidir.
Ücretsiz 
Açık kaynak kodludur (opan source)
Ubuntu Debian kernel(Çekirdek) 
Linux ==> Debian ==> Ubuntu  
2004 yılında piyasaya sürülmüştür.

-------------------------------------------------------------------------

PID: Process ID 
clear 

-------------------------------------------------------------------------

sudo apt-get update 
sudo apt-get upgrade 
sudo apt-get upgrade -y
sudo apt-get dist-upgrade 

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade 

-------------------------------------------------------------------------

Http 
Http Status Codes 
1XX = Information
2XX = Success
3XX = Redirection
4XX = Client Error 
5XX = Server Error 

-------------------------------------------------------------------------

Operation		Format      Installing 
ubuntu          deb         apt,apt-get 
centos          rpm         yum 
fedora			rpm			dnf

sudo apt-get install vim 
sudo apt install vim 
sudo apt install vim -y
sudo apt install -f vim -y (Eğer yükleme zamanında eksik dosyalar varsa sisteme yüklesin)

apt install leafpad
 

-------------------------------------------------------------------------

Linux Dosya Sistemleri
cd /
cd ~

/boot
/dev   => 
/etc  => 
/home   => 
/lib  => 
/media  => 
/opt  => Opsiyonel
/proc => kaynak bilgileri
/root   =>  dosya dizini
/snap   =>  yeni nesil paket yönetimi 
/tmp   =>  geçici dosyaları 
/var   =>  dinamik olarak değişen log, mailbox dosyalar burada barındırılır.


-------------------------------------------------------------------------

lsb_release -a (Linux Dağıtımı hakkında bilgi almak kullanırız.)

-------------------------------------------------------------------------

clear 
sudo apt-get install vlc
sudo snap install vlc
sudo snap list
sudo snap reflesh
sudo snap remove vlc --purge

-------------------------------------------------------------------------

curl --version
sudo apt install curl 
curl --version
curl google.com
ping google.com
man mkdir
info mkdir 
whereis java 
hostname  (Ağ adı)
hostname --help 
pwd (Print Working Directory)
clear
history
whoami
wget : İnternetten bir şey indirmek istersek
wget URL
-------------------------------------------------------------------------

cd . 
cd ..
cd ~
cd ~/Desktop 
cd /

ls -l
ls -al 
ls -lar
 
 
mkdir deneme 
mkdir deneme1 deneme2  
mkdir deneme3\dosyaadi

cat > deneme.txt  (Bütün dosyayı sil sadece son eklediğimi ekle)
cat >> deneme.txt

mv deneme.txt deneme1.txt 
mv deneme1.txt dizinAdi

cp deneme1.txt /app/deneme2.txt

diff deneme1.txt deneme2.txt 

rmdir dizin 
rm dosyaAdi
mkdir deneme\ asd

rm -rf dizinAdi (iç içe dizin varsa silebiliyorsunuz)

-------------------------------------------------------------------------

whereis java 
which ls 
whatis mkdir 
info mkdir 
man mkdir 


-------------------------------------------------------------------------

Editör 

cat >> deneme.txt
tac >> deneme.txt

vim deneme.txt 
vi deneme.txt 
nano deneme.txt

tail deneme.txt       => (Sondan 10 satırı göster)
head -n 15  deneme.txt => (Baştan 15 satırı göster)
tail -n 15 deneme.txt => (Sondan 15 satırı göster)
 
grep satır deneme.txt (Arama Yapmak)


-------------------------------------------------------------------------
Editör 
Giresun BJK - g j k

sudo apt install vim -y

vim deneme.txt 

i = Insert Mode 
esc 
:wq!  kaydet ve çık 
:q!  kaydetmeden çık 

esc
g => İlk satıra git
5j => 5 satır alta in. 
5k => 5 satır yukarı çık


-------------------------------------------------------------------------

Yetkilendirilme 
sudo: super admin (SuperUserDo)
su  : switch user (başka bir kullanıcıya geçiş yapmak istiyorsak)
su root 
su hamit

ls -al 
drwxr-xr-x
d rwx r-x r-x
d = director 
r = read 
w = write 
x = execute

700= sadece ben 
755
777

r        w       x 
2^2=4   2^1= 2   2^0=1
d rwx r-x r-x
  421 401 401
  7    5   5
  7 = dosya sahibi 
  5 = aynı gruptakiler
  5 = diğer gruptakiler


chown => Bir dosyanın yetkisini başka birine vermek istiyorsak.
chown writer deneme.txt service
chmod 755 deneme.txt


-------------------------------------------------------------------------

uname 			  : Linux bilgisini veriyor.
df    			  : disk bilgisini 
df -m 			  : megabayt 
lshw  			  : donanım bilgisi
lshw -short       : donanım bilgisi (kısaltmış)
cat /proc/cpuinfo : CPU 
free -m    		  : Ram bilgisi



-------------------------------------------------------------------------
Sıkıştırma: 
tar: Tape Archive 

c:Create 
f:file 
./*= bütün dosyalar

tar -cf dosyaAdi.tar ./* (Sıkıştırma yapmadan tek dosya haline getir)
tar -xf dosyaAdi.tar (dosyaları teker teker liste)

tar -zcf dosyaAdi.tar.gz ./* (Sıkıştırma yap tek dosya haline getir)
tar -zxf dosyaAdi.tar.gz  (dosyaları teker teker liste)

*/
-------------------------------------------------------------------------

top 
kill pidNumarasi
kill -9 pidNumarasi

-------------------------------------------------------------------------

exit 
reboot
shutdown
ifconfig : ip bilgisini almak
lastlog  : kullanıcıları sisteme ne zaman giriş yaptıklarını listelesin
sudo lastb : Başarısız girişlerde
ps : o anda root kullanıcı ne ile çalışıyor
pstree techcareer : o anda techcareer kullanıcısı ne yapıyor.

-------------------------------------------------------------------------
pstree techcareer

-------------------------------------------------------------------------
Log: Bilgiler
cat /var/log/auth.log 

paste deneme.txt deneme2.txt

-------------------------------------------------------------------------
Service 
systemctl start   programAdi
systemctl status  programAdi
systemctl restart programAdi
systemctl stop    programAdi
systemctl enable  programAdi  (Server başlatıldığında otomatik olarak bu programda başlasın)
systemctl disable  programAdi (Server başlatıldığında otomatik olarak bu programda başlamasın)

-------------------------------------------------------------------------

Calendar 
sudo apt install ncal
cal 
cal 2 2024
cal 2024


-------------------------------------------------------------------------
uptime: server ne zamandır ayakta.
lsb_release -a (Linux Dağıtımı hakkında bilgi almak kullanırız.)

-------------------------------------------------------------------------

User add 
Script Shell 
GitHub
Git 

-------------------------------------------------------------------------
User Add 
whoami 
sudo useradd techcareer => Root olarak yeni kullanıcı ekle
sudo passwd techcareer => Şifre değiştir
sudo userdel techcareer => Kullanıcı Sil
sudo userdel -r techcareer => Recursive olarak sil
compgen -u => Kullanıcı Listelemek
sudo cat /etc/passwd

su techcareer 
password: root 
su hamit 
password: rootroot

usermod -L techcareer (Kullanıcıyı Pasif Getirmek)
usermod -U techcareer (Kullanıcıyı Aktif Getirmek)

ifconfig
ssh techcareer@ipAdresi
root

sudo ufw status 
sudo ufw enable
sudo ufw allow 22
sudo -nlptu 

-------------------------------------------------------------------------
-------------------------------------------------------------------------

Bash Script 





