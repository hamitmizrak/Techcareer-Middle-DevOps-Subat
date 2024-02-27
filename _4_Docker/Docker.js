
========= 
Bare-Metal (Windows 10) 
Virtual Machine ()
Container

-------------------------- 
Docker Nedir ?
LXC : LinuX Containers LXC () Linux Container üzerine kurulu bir container yapısıdır.
Docker 2008 Yılında Soloman Hykes 
2013 Docker Kuruldu 
2014 Docker 1.0
2015 Docker Swarm (Orchestration)
Go diliyle 
Open source
DotCloud =>  Docker INC

Docker CE Major 6, Destek sağlanıyor
Docker EE Major 12-18 ay, Destek sağlanıyor

Docker 
---------------
Hızlı Derleme 
Dağıtım 
Paket Sistemei
Ölçeklendirme (Orch...)
Test Etme

Docker Hub : Image Al/Ver

Docker Platform 
Windows, Linux, MAcOS

------------------------------
docker version 
docker -v
docker --version 

docker info

docker --help
docker image --help

docker -v
mvn -v 
java --version 
node -v

docker run hello-world
docker container run hello-world

------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------
docker search nginx 
docker pull   nginx
docker pull   nginx:latest
docker pull   nginx:1.15


docker pull ubuntu
docker pull alpine
docker pull centos
docker pull mysql
docker pull httpd

------------------------------------
-- Container --
docker container run --publish   1111:80 nginx (publish: reverse proxy port)
docker container run --publish   2222:80 --detach nginx (detach: arka planda çalış lütfen)
docker container run -p   3333:80 -d nginx
docker container run -p 4444:80 -d --name techcareer nginx (name: container adını yazdırmak)

------------------------------------
-- Image --
docker image --help 
docker image ls
docker image prune (prune: kullanılmayan bütün image'leri sil)



------------------------------------
-- List--
docker container ls 
docker container ls -a
docker container ps 
docker ps 

------------------------------------
-- Start/Stop --
docker container stop containerID
docker container stop containerNAME
docker container stop 0023a98fc505
docker container start 0023a98fc505

------------------------------------
-- Delete --
docker container rm  0023a98fc505
docker container rm -f 266f629d9bc0 (f: stop yapmadan sil)
docker container rm -f 0023a98fc505 e5fd3be3f3d7
docker container prune (prune: Çalışmayan bütün containerleri sil)

------------------------------------
-- Monitoring --
docker ps
docker container logs container_ID
docker container logs container_NAME
docker container logs techcareer
docker container logs --details techcareer
docker container logs --tail 5 techcareer (son 5 log'u göster)
docker container logs -f  techcareer (f: follow)

------------------------------------
-- LOGS TIS --
t: top: çalışan processler 
i: inspect detaylı nbilgi 
s:stats: performan bilgi(kaynak tüketimi)

docker container ls 
docker container ps 
docker container top techcareer 
docker container inspect techcareer 
docker container stats techcareer 

------------------------------------
docker search ubuntu 
docker pull ubuntu

alpine => sh 
ubuntu => bash 
window => powershell 

-- Terminal --
## Yeni bir container oluştur ve ona bağlan
docker container run -it -p 1111:80 --name techcareer ubuntu bash
winpty docker container run -it -p 1111:80 --name techcareer ubuntu bash
i: interactive 
t: terminal

docker ps 
## Çalışan bir container üzerinden terminale bağlanacağım. 
docker container exec -it containerID bash


## Kapatılmış container üzerinden terminale bağlanacağım. 
docker container start -ai containerID

Examples
docker search nginx 
docker pull nginx 
docker image ls 

--rm: container stop yaptığınızda otomatik silinir.
docker container run  -p 7777:80 nginx
docker container run -d -p 7777:80 nginx
docker container run -d -p 7777:80 --name web2 nginx
docker container run -p 7777:80 --name web2 --rm nginx
docker container run -d -p 7777:80 --name web2 --rm nginx

docker container exec -it web2 bash
cat > usr/share/nginx/html/index.html 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>Nasılsınız Lorem, ipsum.</p>
</body>
</html>


------------------------------------
-- Mount --
Verilerimizin container dışında güvenl, bir limanda tutmak istiyorsak,  persist data kullanmak zorundayız
1- Volume (Production)  ***(Contaniner dışında özel bir yerde saklansın)
2- Bind Mound (Test) :Host sistemi üzerinde container içinde saklanıyor.

Database (Veri tabanı)
Log 
xml 
json 

volume     : -v  
bind mound : -v 

------------------------------------
-- Bind Mound --
docker search nginx 
docker pull nginx 

index.html
----------
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>Nasılsınız Ben bir Bind Mound Datasıyım.</p>
</body>
</html> 


docker container run -d -p 6666:80 -v TaşınmasınıIstediğimDosyaYer:OrijinalDosyaYeri nginx
sudo docker container run  -d --rm -p 2222:80 --name bind_nginx -v /home/hamit/Desktop/websitem:/usr/share/nginx/html nginx

------------------------------------
-- Volume --
docker volume --help
docker volume create 
docker volume inspect 
docker volume ls 
docker volume prune 
docker volume rm 

index.html
----------
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>Nasılsınız Ben Bir Volume Datasıyım.</p>
</body>
</html> 

docker container exec -it nginx_volume bash
sudo docker container run  -d --rm -p 3333:80 --name volume_nginx -v nginx_volume:/usr/share/nginx/html nginx


------------------------------------
-- Network --

------------------------------------
-- Image Oluşturmak --

------------------------------------
-- Docker Swarm (orchestraction) --










