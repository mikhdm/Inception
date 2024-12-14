#!/bin/bash

CONFIG_FILE=/etc/nginx/nginx.conf

sed -i.original \
		-e "s/{DOMAIN_NAME}/$DOMAIN_NAME/g" \
		$CONFIG_FILE

nginx -g "daemon off;"
