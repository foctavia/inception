#!/bin/bash

service mysql start

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`foctavia\`@'localhost' IDENTIFIED BY 'thepass';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`wordpress\`.* TO \`foctavia\`@'%' IDENTIFIED BY 'thepass';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Octavia19!';"

mysqladmin -u root -pOctavia19! shutdown

exec mysqld_safe