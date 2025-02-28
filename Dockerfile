

FROM node:18-alpine

WORKDIR /app


COPY package.json yarn.lock ./


RUN yarn install


RUN npm install --platform=linux --arch=x64 sharp


COPY . . 

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


RUN yarn develop

EXPOSE 1337

ENTRYPOINT ["/app/entrypoint.sh"]


