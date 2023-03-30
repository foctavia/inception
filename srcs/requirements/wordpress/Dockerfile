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
RUN			wget https://wordpress.org/wordpress-6.2.tar.gz -P /var/www
RUN			cd /var/www \
			&& tar -xzf wordpress-6.2.tar.gz \
			&& rm wordpress-6.2.tar.gz
RUN			chown -R root:root /var/www/wordpress

# add configuration for php
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d

# install CLI to automatically configure wordpress
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

# create a folder for php to run
RUN			mkdir /run/php

COPY		./conf/wp-config.php /var/www/html/wp-config.php

# # launch a script to configure wordpress
# COPY		./conf/auto_config.sh /usr/local/bin/
# RUN			chmod +x /usr/local/bin/auto_config.sh
# ENTRYPOINT	["/usr/local/bin/auto_config.sh"]

WORKDIR		/var/www/html/

CMD			[ "/usr/sbin/php-fpm7.3", "-F" ]