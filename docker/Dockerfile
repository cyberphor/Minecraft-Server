# Dockerfile metadata
FROM alpine:latest
LABEL Author="Victor Fernandez III, @cyberphor"

# install Python
RUN apk add --no-cache python3 py3-pip openjdk17 py-requests

# create the directory needed
WORKDIR /opt/minecraft-server

# copy the files needed
COPY eula.txt eula.txt
COPY get_minecraft.py get_minecraft.py
RUN python3 get_minecraft.py

# start the Minecraft server
CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft.jar", "nogui" ]