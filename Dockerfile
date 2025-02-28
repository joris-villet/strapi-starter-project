FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN yarn install

# Bundle app source
COPY . .

# Build the Strapi project
RUN yarn build 

# Expose port
EXPOSE 1337

# Start the server
CMD ["yarn", "develop"]
