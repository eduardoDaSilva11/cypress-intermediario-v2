FROM cypress/included:10.11.0

EXPOSE 80 22

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npx", "cypress", "run"]
