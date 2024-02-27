# Image oluşturacagim
# docker image build -t my_spring_react .


# JDK Sürümü
FROM openjdk:21

# Bilgilendirme 
LABEL maintainer="hamitmizrak@gmail.com"

# Cevresel Degiskenler
ENV APP_NAME="Blog Project"
ENV VERSION="v1.0.0"
ENV PORT ="4444"

# Echo Çıktı Almak
RUN echo "App Data Name : $APP_NAME"
RUN echo "App Data Version : $VERSION"
RUN echo "App Data Port : $PORT"

# Kalıcılık
VOLUME /tmp 

# PORT 
EXPOSE 4444 

# Proje Jar ismini kısaltmak
ARG JAR_FILE=./*.jar

ADD ${JAR_FILE} spring_react

ENTRYPOINT [ "java","-jar","/spring_react" ]


