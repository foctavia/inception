#!bin/bash

cd /var/www/wordpress

sleep 10

sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

# wp config create	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'

# wp core install		--allow-root \
# 					--title=$WP_TITLE \
# 					--admin_user=$WP_ADMIN_USER \
# 					--admin_password=$WP_ADMIN_PASSWORD \
# 					--admin_email=$WP_ADMIN_EMAIL \
# 					--url=$WP_URL

# wp user create		$WP_USER $WP_USER_EMAIL \
# 					--allow-root \
# 					--role=author \
# 					--user_pass=$WP_USER_PASSWORD
		