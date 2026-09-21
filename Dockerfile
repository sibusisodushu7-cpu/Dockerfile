FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .

# Build the project
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Find the built jar, rename it to app.jar, and print directory contents to the log
RUN cp target/*.jar ./app.jar && ls -la

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
