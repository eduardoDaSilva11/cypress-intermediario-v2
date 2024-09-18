FROM node:16

RUN sed -i 's|http://deb.debian.org/debian|http://ftp.<local-mirror>|g' /etc/apt/sources.list

RUN apt-get update || (sleep 30 && apt-get update) && \
    apt-get install -y --no-install-recommends \
        curl \
        openssh-client \
        ca-certificates \
        postfix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    npm install -g cypress

EXPOSE 80 22

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npx", "cypress", "run"]
