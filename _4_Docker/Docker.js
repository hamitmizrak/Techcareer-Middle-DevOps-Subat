
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

docker container run --publish   1111:80 nginx (publish: reverse proxy port)
docker container run --publish   2222:80 --detach nginx (detach: arka planda çalış lütfen)
docker container run -p   3333:80 -d nginx
docker container run -p 4444:80 -d --name techcareer nginx (name: container adını yazdırmak)

docker container ls 
docker container ls -a
docker container ps 
docker ps 


docker container stop containerID
docker container stop containerNAME
docker container stop 0023a98fc505
docker container start 0023a98fc505


docker container rm  0023a98fc505
docker container rm -f 266f629d9bc0 (f: stop yapmadan sil)
docker container rm -f 0023a98fc505 e5fd3be3f3d7

docker ps
docker container logs container_ID
docker container logs container_NAME
docker container logs techcareer
docker container logs --details techcareer
docker container logs --tail 5 techcareer (son 5 log'u göster)
docker container logs -f  techcareer (f: follow)

docker container prune (prune: Çalışmayan bütün containerleri sil)


 











docker pull ubuntu
docker pull alpine
docker pull centos
docker pull mysql
docker pull httpd
