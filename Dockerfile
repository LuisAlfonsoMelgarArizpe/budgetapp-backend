# docker build -t budgetapp_backend:1.0 .

# docker run -p 4000:4000 -d budgetapp_backend:1.0

FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD [ "npm", "start" ]