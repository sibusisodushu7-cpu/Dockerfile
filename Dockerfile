FROM openjdk:21-slim
COPY . /app
WORKDIR /app
RUN javac *.java
CMD ["java", "App"]
