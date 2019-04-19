FROM node:alpine

ENV NODE_ENV production

COPY . /data
RUN apk add --no-cache git bash \
    && cd data \
    && npm install

WORKDIR /data
EXPOSE 8090
CMD ["npm","start"]
