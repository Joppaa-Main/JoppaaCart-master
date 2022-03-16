FROM mhart/alpine-node:8

ENV NODE_VERSION 8.9.4

RUN apk add --no-cache make gcc g++ python bash

WORKDIR /var/joppaacart

COPY lib/ /var/joppaacart//lib/
COPY bin/ /var/joppaacart//bin/
COPY config/ /var/joppaacart//config/
COPY public/ /var/joppaacart//public/
COPY routes/ /var/joppaacart//routes/
COPY views/ /var/joppaacart//views/

COPY app.js /var/joppaacart//
COPY package.json /var/joppaacart//
COPY deploy.js /var/joppaacart//

RUN npm install

VOLUME /var/joppaacart//data

EXPOSE 1111
ENTRYPOINT ["npm", "start"]
