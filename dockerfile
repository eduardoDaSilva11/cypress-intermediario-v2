FROM node:16

RUN apt-get update && \
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
