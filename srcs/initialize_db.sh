service nginx start
service mysql start
service php7.3-fpm start

echo "CREATE DATABASE db;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES on db.* to 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root'" | mysql -u root --skip-password

bash
