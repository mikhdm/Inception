FROM debian:buster-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
		apt-get install -y mariadb-server && \
		apt-get clean -y && \
		mkdir -p /docker-entrypoint-initdb.d /var/run/mysql

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/init.sql /docker-entrypoint-initdb.d/init.sql
COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

RUN chown -R mysql:mysql /var/run/mysql /var/lib/mysql /docker-entrypoint-initdb.d \
		&& chmod u+x /docker-entrypoint.sh

VOLUME /var/lib/mysql

ENTRYPOINT [ "/docker-entrypoint.sh" ]
