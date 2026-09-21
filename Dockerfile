FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
# This compiles your project and forces it to build the actual jar
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
# This copies the newly built jar from the build stage, no matter what its name is
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
