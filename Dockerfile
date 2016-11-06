FROM node:4.6.1
MAINTAINER Stefan Dimitrov <stefan@dimitrov.li>

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* && \
    curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip && \
    mkdir -p /var/www/ghost && \
    unzip -uo ghost.zip -d /var/www/ghost && \
    rm -f ghost.zip && \
    cd /var/www/ghost && npm install --production

WORKDIR /var/www/ghost

EXPOSE 2368

ENTRYPOINT ["npm", "start", "--production"]
