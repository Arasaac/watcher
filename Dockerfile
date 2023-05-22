FROM node:14-buster
LABEL maintainer="juandacorreo@gmail.com"

ENV NODE_ENV=production
ENV PORT=3000

# Set working directory
RUN mkdir /app
WORKDIR /app


# Bundle app source
COPY . . 

# Install app dependencies
COPY package*.json ./
RUN npm install -g node-gyp
RUN npm install --production


EXPOSE $PORT

USER node

# Run this app when a container is launched
# base image entrypoint will add node command
CMD [ "watcher.js" ]
