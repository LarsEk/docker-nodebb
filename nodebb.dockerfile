# The base image is the latest 4.x node (LTS) on jessie (debian)
# -onbuild will install the node dependencies found in the project package.json
# and copy its content in /usr/src/app, its WORKDIR
FROM node:4-onbuild

ENV NODE_ENV=production \
    daemon=true \
    silent=true

# nodebb setup will ask you for connection information to a redis (default), mongodb then run the forum
# nodebb upgrade is not included and might be desired
RUN node app --setup && npm start

# the default port for NodeBB is exposed outside the container
EXPOSE 80
EXPOSE 443
EXPOSE 4567

CMD node app.js