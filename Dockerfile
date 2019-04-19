FROM node:alpine

ENV NODE_ENV production

COPY . /data
RUN apk add --no-cache git bash \
    && cd data \
    && npm install && npm run build \
    && sed -ri -e "s/8601/80,\n\tdisableHostCheck: true/" ./webpack.config.js

WORKDIR /data
EXPOSE 8090
CMD ["npm","start"]
