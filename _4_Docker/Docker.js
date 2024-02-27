
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
$ docker volume --help
$ docker volume create volumeName
$ docker volume ls 
$ docker volume inspect volumeName
$ docker volume prune 
$ docker volume rm 

Mountpoint : Volume fiziksel olarak bulunduğu yer demektir.
"Mountpoint": "/var/lib/docker/volumes/volumeName/_data",


$ mintty docker container run -it -v volumeName:/webpages ubuntu sh
$ mintty docker container run -it -v volumeName:/webpages alpine sh
$ docker volume ls
$ docker volume inspect volumeName

$ cd /webpages 
$ cat >> index.html
-----------------------
### index.html ###
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
$ exit 

---------------------------------------------------------
docker search mysql 
docker pull mysql 
docker ps 
docker image ls 
netstat -nlptu

docker container run -p 3306:3306 --name my_special_mysql -e MYSQL_ROOT_PASSWORD=root mysql

docker container ls 
docker container inspect my_special_mysql
# Destination Volumes: "/var/lib/mysql"

docker container exec -it my_special_mysql bash 
mysql -u root -p 
password:root

CREATE SCHEMA `volume` DEFAULT CHARACTER SET utf8 ;
use volume;
CREATE TABLE `volume`.`blog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(250) NULL,
  `content` VARCHAR(250) NULL,
  `created_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

  INSERT INTO `volume`.`blog` (`title`, `content`) VALUES ('title-1', 'content-1');
  INSERT INTO `volume`.`blog` (`title`, `content`) VALUES ('title-2', 'content-2');
  SELECT * FROM volume.blog;

-- MYSQL VOLUME DEVAM
docker container run  --name mysqlhamitmizrak77 -e MYSQL_ROOT_PASSWORD=root  -p 3306:3306 -v mysql-db:/var/lib/mysql mysql
isterseniz detach yapabilirsiniz
docker container run -d --name mysqlhamitmizrak77 -e MYSQL_ROOT_PASSWORD=root  -p 3307:3306 -v mysql-db:/var/lib/mysql mysql

docker container exec -it mysqlhamitmizrak77 bash 
mysql -u root -p 
password:root
use volume;
SELECT * FROM volume.blog;


------------------------------------
-- Image Oluşturmak --
docker login

docker image --help
docker image ls 
docker image tag --help 

DockerHub Repository Name: javahamitmizrak/spring_react_blog
imageName: Oluşturduğumuz DockerFile veya docker-compose.yml'da veya daha önceden pull yaptığımız image adları.

docker image tag imageName javahamitmizrak/spring_react_blog
docker image tag my_spring_react:latest javahamitmizrak/spring_react_blog

docker push javahamitmizrak/spring_react_blog
docker image ls 
docker image rm imageName
docker pull javahamitmizrak/spring_react_blog
docker logout

------------------------------------
-- Docker Swarm (orchestraction) --
K8S - Docker Swarm (Birden fazla  container yönetiminde)

Docker Swarm (Docker Engine içerisinde )
docker info 
Eğer Swarm inacative görünmüyorsa =>   
docker swarm leave --force
docker swarm init

Manager - Worker 
docker swarm --help

docker swarm init (active et)
docker swarm leave (Swarm Kapat)
docker swarm update (Swarm Güncellemek)

docker swarm node ls 

------------------------------------
-- Service --
docker service --help  (service: çalışan container kapandığında otomatik olarak açsın ve o container sürekli çalışsın)
docker service ls 
docker service ps ID 
docker service rm ID 
docker container rm -f containerID

Manager Node Raft Consensus Algoritması
N-1/2


------------------------------------
-- Volume --


------------------------------------
-- Swarm --


------------------------------------
-- Network --


------------------------------------
------------------------------------
------------------------------------
SonarQube
Grafana / Prometheus














