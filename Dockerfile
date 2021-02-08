FROM debian:buster

WORKDIR /var/www/aannett

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget \
	&& apt-get -y install nginx && apt-get -y install mariadb-server \
	&& apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd \
	php-cli php-mbstring php-curl php-intl php-soap php-xml php-xmlrpc php-zip \
	&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz \
	&& tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm -rf phpMyAdmin-5.0.4-english.tar.gz \
	&& mv phpMyAdmin-5.0.4-english phpmyadmin \
	&& wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz \
	&& rm -rf latest.tar.gz && rm -rf /etc/nginx/sites-available/default \
	&& rm -rf /etc/nginx/sites-enabled/default \
	&& openssl req	-newkey rsa:2048 \
					-x509 \
					-sha256 \
					-nodes \
					-days 365 \
					-subj "/CN=aannett/" \
					-keyout /etc/ssl/private/nginx-selfsigned.key \
					-out /etc/ssl/certs/nginx-selfsigned.crt 

COPY /srcs/config.inc.php phpmyadmin
COPY /srcs/wp-config.php wordpress
COPY /srcs/nginx.conf /etc/nginx/sites-available/aannett
COPY /srcs/nginx.conf /var/www/aannett
COPY /srcs/initialize_db.sh ./
COPY /srcs/turn_autoindex_on.sh ./
COPY /srcs/turn_autoindex_off.sh ./
COPY /srcs/nginx_autoindex_off.conf /var/www/aannett

RUN ln -s /etc/nginx/sites-available/aannett /etc/nginx/sites-enabled/ \
	&& chown -R www-data:www-data * && chmod -R 755 *

EXPOSE 80 443

CMD bash initialize_db.sh

