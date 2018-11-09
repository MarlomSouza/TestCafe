FROM node
WORKDIR /home/node
COPY . .
RUN npm install -g testcafe && apt-get update && apt-get install chromium -y

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 1337 1338
# ENTRYPOINT [ "testcafe 'path:../../usr/bin/chromium --no-sandbox' *.js" ]
