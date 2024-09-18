FROM node:16

# Instalar Cypress e dependências principais em uma única camada
RUN npm install -g cypress && \
    apt-get update && \
    apt-get install -y \
        curl \
        openssh-client \
        ca-certificates \
        postfix \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80 22

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .

CMD ["npx", "cypress", "run"]
