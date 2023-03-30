FROM	debian:buster

EXPOSE	443

# install nginx and openssl on the start
RUN		apt-get update -y && apt-get upgrade -y
RUN 	apt-get install -y nginx
RUN		apt-get install -y openssl

# create key and TSL certificate
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=foctavia.42.fr/UID=foctavia"

# create nginx config
RUN 	mkdir -p /var/run/nginx
COPY	./conf/nginx.conf /etc/nginx/nginx.conf

# give appropriate right on executing files
RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

CMD		[ "nginx", "-g", "daemon off;" ]