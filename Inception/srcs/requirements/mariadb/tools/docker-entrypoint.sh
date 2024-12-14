#!/bin/bash

INIT_FILE=/docker-entrypoint-initdb.d/init.sql
CONFIG_FILE=/etc/mysql/my.cnf

sed -i.original \
		-e "s/{MYSQL_ROOT_PASSWORD}/$MYSQL_ROOT_PASSWORD/g" \
		-e "s/{MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" \
		-e "s/{MYSQL_USER}/${MYSQL_USER:-mysql}/g" \
		-e "s/{MYSQL_DB}/$MYSQL_DB/g" \
		-e "s/{MYSQL_REMOTE_HOST}/$MYSQL_REMOTE_HOST/g" \
		-e "s/{MYSQL_REMOTE_PASSWORD}/$MYSQL_REMOTE_PASSWORD/g" \
		$INIT_FILE

sed -i.original \
		-e "s/{MYSQL_PORT}/${MYSQL_PORT:-3306}/g" \
		-e "s/{MYSQL_USER}/${MYSQL_USER:-mysql}/g" \
		$CONFIG_FILE

mysqld --init-file=$INIT_FILE
