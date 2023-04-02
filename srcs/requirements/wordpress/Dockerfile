FROM		debian:buster

EXPOSE		9000

# install wget and php with its dependencies
RUN			apt-get update -y && apt-get upgrade -y
RUN 		apt-get install -y wget
RUN			apt-get install -y php7.3 \
			php-fpm \
			php-mysql \
			mariadb-client

# download and install wordpress
RUN			wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN			cd /var/www \
			&& tar -xzf wordpress-6.0.tar.gz \
			&& rm wordpress-6.0.tar.gz
RUN			chown -R root:root /var/www/wordpress

# add configuration for php
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d

# create a folder for php to run
RUN			mkdir /run/php

# install CLI to automatically configure wordpress
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

# launch a script to create wp config file and users
COPY		./tools/config_users.sh /
RUN			chmod +x ./config_users.sh
ENTRYPOINT	["./config_users.sh"]