FROM		debian:buster

EXPOSE		3306

# install mariadb from the start
RUN			apt-get update -y && apt-get upgrade -y
RUN 		apt-get install -y mariadb-server

# create mariadb config file
RUN			rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

# run a script that create database and user
COPY		./tools/user_database.sh /
RUN			chmod +x ./user_database.sh
ENTRYPOINT	["./user_database.sh"]