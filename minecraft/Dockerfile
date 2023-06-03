FROM alpine:latest

LABEL Author="Victor Fernandez III, @cyberphor"

WORKDIR /opt/minecraft
COPY . .

RUN apk add --no-cache python3 py3-pip openjdk17 &&\
    python3 -m pip install requests &&\
    python3 get_minecraft.py

ENTRYPOINT [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft.jar", "nogui" ]