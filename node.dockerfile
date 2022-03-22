FROM        node:alpine

LABEL       author="Martin Mwangi"

# ARG         PACKAGES=nano
ENV 		NODE_ENV=production
ENV 		PORT=3300
# ENV         TERM xterm
# RUN         apk update && apk add $PACKAGES

WORKDIR     /var/www
COPY        package.json package-lock.json ./
RUN         npm install

COPY        . ./
EXPOSE      $PORT

ENTRYPOINT  ["npm", "start"]
