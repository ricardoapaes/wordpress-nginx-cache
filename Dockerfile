FROM nginx:latest

ENV WORDPRESS_PROTOCOL=https
ENV WORDPRESS_HOST=wordpress
ENV WORDPRESS_PORT=80

ENV DOCKERIZE_VERSION v0.9.3
RUN apt-get update \
    && apt-get install -y wget \
    && wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin \
    && apt-get autoremove -yqq --purge wget && rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/default.tpl

COPY config.sh /docker-entrypoint.d/00-config.sh
RUN chmod +x /docker-entrypoint.d/00-config.sh