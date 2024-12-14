FROM debian:buster-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
		&& apt-get install -y php7.3-fpm php-mysql mariadb-client \
		&& mkdir /docker-entrypoint-init.d

COPY ./tools/wordpress-6.1.1.tar.gz /
COPY ./tools/wp-cli.phar /
COPY ./tools/docker-entrypoint.sh /
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

RUN DEBIAN_FRONTEND=noninteractive tar xzvf wordpress-6.1.1.tar.gz && \
		mv wordpress www && \
		rm -rf wordpress-6.1.1.tar.gz

COPY ./conf/wp-config.php /www/wp-config.php
COPY ./tools/favicon.ico /www/favicon.ico

RUN mkdir -p /var/log/php7.3-fpm \
		&& touch /var/log/php7.3-fpm/access.log /var/log/php7.3-fpm/error.log \
		&& chmod 755 /wp-cli.phar \
		&& mv /wp-cli.phar /usr/local/bin/wp \
		&& chown -R www-data:www-data /etc/php/7.3/fpm /www /var/log/php7.3-fpm /docker-entrypoint-init.d \
		&& chmod 755 /www \
		&& chown www-data:www-data /docker-entrypoint.sh \
		&& chmod u+x /docker-entrypoint.sh \
		&& chmod 644 /var/log/php7.3-fpm/access.log /var/log/php7.3-fpm/error.log

USER www-data
VOLUME /www
	
ENTRYPOINT [ "/docker-entrypoint.sh" ]
