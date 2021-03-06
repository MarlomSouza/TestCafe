# FROM node
# WORKDIR /app
# COPY . .
# RUN npm install -g testcafe && apt-get update && apt-get install chromium xvfb -y

# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
#   echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
#   apt-get update && \
#   apt-get install -y google-chrome-stable && \
#   rm -rf /var/lib/apt/lists/*

# EXPOSE 1337 1338 9222
# # ENTRYPOINT [ "testcafe 'path:../../usr/bin/chromium --no-sandbox' *.js" ]
FROM alpine:edge  

WORKDIR /app
COPY . .

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ upgrade
RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add \
 nodejs nodejs-npm chromium xwininfo xvfb dbus eudev ttf-freefont fluxbox procps
RUN npm install -g testcafe
# CMD [ "Xvfb :99 & export DISPLAY=:99 && testcafe 'path:../usr/bin/chromium-browser --no-sandbox' *.js" ]
#  [ " Xvfb :99 & export DISPLAY=:99 && testcafe 'path:../usr/bin/chromium-browser --no-sandbox' PrimeiroTeste.js" ]