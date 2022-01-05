# Specify the base image
FROM node:alpine

# WORKDIR specifies the context to the COPY that follows it
# this is important to add due to changes in nodejs starting version 15
WORKDIR /usr/app

# Copy everything from the current working dir of simple-node-docker
# to the current working dir of the container
COPY ./ /usr/app

# Install some dependencies
RUN npm install

# Default command
CMD ["npm", "start"]