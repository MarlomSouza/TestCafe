FROM alpine:edge  

WORKDIR /app
COPY . .

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ upgrade
RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add \
 nodejs nodejs-npm chromium xwininfo xvfb dbus eudev ttf-freefont fluxbox procps
RUN npm install -g testcafe
# CMD [ "Xvfb :99 & export DISPLAY=:99 && testcafe 'path:../usr/bin/chromium-browser --no-sandbox' *.js" ]
#  [ " Xvfb :99 & export DISPLAY=:99 && testcafe 'path:../usr/bin/chromium-browser --no-sandbox' PrimeiroTeste.js" ]