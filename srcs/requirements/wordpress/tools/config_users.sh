#!bin/bash

cd /var/www/wordpress

if [-e wp-config.php]
then
	echo "Wordpress is already configured"
else
	sleep 10

	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

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

fi

# add redis cache (bonus)
wp config	set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

exec /usr/sbin/php-fpm7.3 -F
		