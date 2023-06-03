FROM maven as build
 WORKDIR /app
 COPY . .
 RUN mvn install
 
 FROM openjdk:11.0
 WORKDIR /app
 copy --from=build /app/target/maven-web-application.war /app/
 EXPOSE 9090
 CMD ["java","-jar","maven-web-application.war"]  
