FROM node:16.8.0-stretch
LABEL org.opencontainers.image.source https://github.com/BCIT-LTC/datahub-connector

# RUN apk add --no-cache bash

WORKDIR /app

COPY public public
COPY src src
COPY babel.config.js .
COPY package-lock.json .
COPY package.json .
COPY vue.config.js .

RUN npm install
RUN npm run build

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 8080

ENTRYPOINT [ "/app/entrypoint.sh" ]

CMD [ "npm", "start" ]