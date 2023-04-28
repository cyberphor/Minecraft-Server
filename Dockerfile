FROM alpine:latest

LABEL Author="Victor Fernandez III, @cyberphor"

WORKDIR /minecraft

COPY server.properties .

COPY get_minecraft.py .

COPY eula.txt .

RUN apk add --no-cache python3 py3-pip openjdk17

RUN python3 -m pip install requests

RUN python3 get_minecraft.py

ENTRYPOINT [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft.jar", "nogui" ]