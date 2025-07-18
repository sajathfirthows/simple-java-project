FROM openjdk:11-jre-slim

# Copy WAR file into container
COPY target/works-with-heroku-1.0.war /app/app.war

# Download Jetty runner (or use your existing jetty-runner.jar)
ADD https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.3.3.v20150827/jetty-runner-9.3.3.v20150827.jar /app/jetty-runner.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/jetty-runner.jar", "--port", "8080", "/app/app.war"]

