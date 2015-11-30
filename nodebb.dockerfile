# Pull base image.
FROM ubuntu:latest
MAINTAINER NodeBB Docker Team <docker-devs@nodebb.org>

# Install base packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nodejs nodejs-legacy npm imagemagick git -y

# Install nodebb
RUN cd /opt && git clone -b v0.9.x https://github.com/NodeBB/NodeBB nodebb
RUN cd /opt/nodebb && npm install --production
# RUN npm install redis@~0.10.1 connect-redis@~2.0.0
# RUN npm install -g supervisor

# Create a mountable volume
VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 4567

# Define default command.
# COPY config.json ./
# RUN node app --setup

# CMD node app --setup && npm start
# CMD supervisor app # supervisor works but still needs setup
CMD url=<your url>:80 node app.js # web setup will work with this