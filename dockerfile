FROM node:16

RUN npm install -g cypress

RUN apt-get update && apt-get install -y curl openssh-server ca-certificates postfix

RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

EXPOSE 80 22

WORKDIR /app
COPY . .

RUN npm install

CMD ["npx", "cypress", "run"]
