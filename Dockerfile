

FROM node:18-alpine

WORKDIR /opt/app

COPY package.json yarn.lock ./


RUN npm install -g yarn


RUN npm install --platform=linux --arch=x64 sharp


COPY . . 

COPY entrypoint.sh /opt/app/entrypoint.sh
RUN chmod +x /opt/app/entrypoint.sh


EXPOSE 1337

CMD ["/opt/app/entrypoint.sh"]


