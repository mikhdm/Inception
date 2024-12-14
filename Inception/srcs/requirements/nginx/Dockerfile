FROM debian:buster-slim

ARG CERTS_DIR
ARG CERTS_KEY

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
		DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/docker-entrypoint.sh /
COPY ./conf/certs ${CERTS_DIR}
RUN perl -e 'use feature "say"; say $ENV{CERTS_KEY}' > ${CERTS_DIR}/key.pem \
		&& sed -i '/^$/d' ${CERTS_DIR}/key.pem \
		&& chmod u+x /docker-entrypoint.sh

VOLUME /www
EXPOSE 443

ENTRYPOINT [ "/docker-entrypoint.sh" ]
