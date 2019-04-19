FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN apk update && apk upgrade && \
    apk add --no-cache git
COPY package.json /usr/src/app/
RUN npm install && npm cache clean --force
COPY . /usr/src/app
CMD [ "npm", "start" ]
