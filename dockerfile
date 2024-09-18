FROM node:16

RUN npm install -g cypress && \
    apt-get update && \
    apt-get install -y curl openssh-server ca-certificates postfix && \
    curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 22

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .

CMD ["npx", "cypress", "run"]
