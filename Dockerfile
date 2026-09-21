FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .

# Run the build
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Automatically find whatever .jar was created and rename it to app.jar
RUN mv target/*.jar target/app.jar

EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]
