FROM        node:alpine

LABEL       author="Martin Mwangi"
 
ARG 		buildVersion

# ARG         PACKAGES=nano
ENV 		NODE_ENV=production
ENV 		PORT=3300
ENV 		build=$buildVersion
# ENV         TERM xterm
# RUN         apk update && apk add $PACKAGES

WORKDIR     /var/www
COPY        package.json package-lock.json ./
RUN         npm install

COPY        . ./
EXPOSE      $PORT

RUN			echo "Build version: $build"

ENTRYPOINT  ["npm", "start"]
