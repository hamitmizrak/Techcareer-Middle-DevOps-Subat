# Sonar Readme
---
Sonar Gereksinimler
Java 17
Postgresql 

Windows çalıştırma ==> C:\sonarqube\bin\windows-x86-64\StartSonar.bat
username:admin
password:adminadmin


# Java Maven => Pom.xml
```sh
-- dependencies --
<dependency>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.8.10</version>
</dependency>

--- Build ---
<plugin>
    <groupId>org.sonarsource.scanner.maven</groupId>
    <artifactId>sonar-maven-plugin</artifactId>
    <version>3.3.0.603</version>
</plugin>
```

# 1.YOL (sonarQube Server ) Java root kısmında bunu terminalde çalıştırın

Eğer çalışmazsa => 
C:\sonarqube\sonarqube-10.4.1.88267\conf
içine => wrapper.conf içine aşağıdaki path sizin ki ile karşılaştırıp deneyelim.

> wrapper.java.command=C:\Program Files\Java\jdk-11\bin/java

mvn clean verify sonar:sonar \
  -Dsonar.projectKey=spring_boot_sonar \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_507e683324d96ef62259c2535dbda27496c4a98e

# 2.YOL (sonarQube Scanner) Java root kısmında bunu terminalde çalıştırın
Windows Path => Path ekle => C:\sonarqube\sonar-scanner-cli-5.0.1.3006-windows\sonar-scanner-5.0.1.3006-windows\bin
