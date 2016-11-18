FROM node:4

ENV NODE_ENV production

RUN apt-get update \
	&& apt-get install -y libkrb5-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -SL -o /usr/local/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
	&& chmod +x /usr/local/bin/wait-for-it.sh

RUN mkdir /usr/src/app
COPY crowi/ /usr/src/app

WORKDIR /usr/src/app

RUN npm install --unsafe-perm

COPY docker-crowi/docker-entrypoint.sh /entrypoint.sh

VOLUME /data
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "start"]