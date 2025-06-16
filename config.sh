#!/bin/sh

echo "Changing host to ${WORDPRESS_PROTOCOL}://${WORDPRESS_HOST}:${WORDPRESS_PORT}"
dockerize -template /etc/nginx/conf.d/default.tpl:/etc/nginx/conf.d/default.conf

dockerize -wait tcp://${WORDPRESS_HOST}:${WORDPRESS_PORT} -timeout 60s