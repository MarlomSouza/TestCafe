FROM node
WORKDIR /home/node
COPY tests .
RUN npm install -g testcafe && apt-get update && apt-get install chromium -y && apt-get install xvfb -y && apt-get install fluxbox
EXPOSE 1337 1338
ENTRYPOINT [ "../../bin/bash" ]
