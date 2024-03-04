# Sonar Readme
---
Sonar Gereksinimler
Java 17

Windows çalıştırma ==> C:\sonarqube\bin\windows-x86-64\StartSonar.bat
username:admin
password:adminadmin


# Java Maven => Pom.xml
```sh
--dependencies--
<dependency>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.8.10</version>
</dependency>

---Build---
<plugin>
    <groupId>org.sonarsource.scanner.maven</groupId>
    <artifactId>sonar-maven-plugin</artifactId>
    <version>3.3.0.603</version>
</plugin>
```


# Java root kısmında bunu terminalde çalıştırın
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=spring_boot_sonar \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_507e683324d96ef62259c2535dbda27496c4a98e
