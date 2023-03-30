#!bin/bash

sleep 10

wp core install		--allow-root \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--url=$WP_URL

wp user create		$WP_USER $WP_USER_EMAIL \
					--allow-root \
					--role=author \
					--user_pass=$WP_USER_PASSWORD

exec /usr/sbin/php-fpm7.3 -F
		