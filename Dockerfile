FROM node:16.20-alpine3.16
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
COPY package.json       /app/
COPY package-lock.json  /app/
COPY flows.json         /app/
COPY flows_cred.json    /app/
COPY settings.js        /app/
WORKDIR /app
ENV NODEREDLABEL=blinky-mqtt-trays
ENV ADMINNAME=ADMIN
ENV NODEREDPORT=60428
ENV ENABLE_NODERED_EDITOR=0
RUN npm install
CMD ["sh", "-c", "exec node --max-old-space-size=384 node_modules/node-red/red.js -s ./settings.js -u ./"]