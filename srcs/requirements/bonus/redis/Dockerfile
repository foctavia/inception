FROM		debian:buster

EXPOSE		6379

# install redis
RUN			apt-get update -y && apt-get upgrade -y
RUN			apt-get install -y redis
RUN			apt-get install -y redis-server
RUN			apt-get install -y wget

# configure redis as cache
COPY		./conf/redis_config.sh /
RUN			chmod +x ./redis_config.sh
ENTRYPOINT	["./redis_config.sh"]

# # obtain redis cache backend script
# RUN			wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
# RUN			chmod +x object-cache.php
# RUN			mv object-cache.php /var/www/wordpress/wp-content/

