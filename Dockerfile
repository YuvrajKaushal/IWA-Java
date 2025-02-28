FROM openjdk:11-jdk-slim

LABEL maintainer="kevin.lee@microfocus.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Location of WebInspect RuntTime Agent - uncomment if required
#ARG WI_AGENT_DIR=/installs/Fortify_WebInspect_Runtime_Agent_Java_21.3.1/

# The application's jar file
ARG JAR_FILE=target/iwa.jar

# Copy Fortify WebInspect Runtime Agent directory to the container - uncomment if required
#COPY ${WI_AGENT_DIR} /wirtagent

# Copy the application's jar to the container
COPY ${JAR_FILE} app.jar

# JAVA_OPTS to be passed in
ENV JAVA_OPTS="-Xmx512m -Xss256k"

# Run the jar file
# Uncomment if not using WebInspect Agent
ENTRYPOINT ["java","-jar","/app.jar"]
# Comment out if not using WebInspect Agent
#ENTRYPOINT ["java","-javaagent:/wirtagent/lib/FortifyAgent.jar","-jar","/app.jar"]

