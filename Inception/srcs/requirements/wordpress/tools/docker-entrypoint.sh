#!/bin/bash

if ! wp core is-installed --path=/www; then
	wp core install \
		--path=/www \
		--url=${WORDPRESS_DOMAIN} \
		--title="${WORDPRESS_TITLE}" \
		--admin_user=${WORDPRESS_ADMIN_NAME} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} \
		--skip-email

	wp user create \
		--path=/www \
		--quiet \
		${WORDPRESS_USER_NAME} \
		${WORDPRESS_USER_EMAIL} \
		--user_pass=${WORDPRESS_USER_PASSWORD} \
		--role=author
fi

php-fpm7.3 -F
