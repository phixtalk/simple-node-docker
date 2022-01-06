# Specify the base image to create container from
FROM node:alpine

# WORKDIR specifies the working directory for your project 
# and also sets the context to the COPY that follows it
# this is important so as to not use the container's root directory for your app
# because your app files might overwrite some system files in the root directory
# it is now compulsory as from nodejs version >= 15
WORKDIR /usr/app

# Copy this file from local machine to current working directory of container
COPY ./package.json ./

# Install some dependencies
# notice the position of npm install. this is so we done re-run npm install
# everytime we rebuild the docker image or make changes to other files
# the only time we run npm install is if the package.json file changes or
# any of the codes from this line and above changes
RUN npm install

# Copy everything from the current working dir of simple-node-docker
# to the current working dir of the container
COPY ./ ./

# Default command
CMD ["npm", "start"]