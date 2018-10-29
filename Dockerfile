FROM alpine:edge

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add \
 nodejs nodejs-npm chromium firefox xwininfo xvfb dbus eudev ttf-freefont fluxbox

COPY . /opt/testcafe

RUN cd /opt/testcafe; \
 npm install --production && \
 npm cache clean --force && \
 rm -rf /tmp/* 

EXPOSE 1337 1338