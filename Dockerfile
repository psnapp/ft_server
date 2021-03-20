FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install vim
RUN apt-get -y install mariadb-server
RUN apt-get -y install php php-mysql php-cli php-fpm php-mbstring php-zip php-gd
RUN mv /var/www/html /var/www/localhost

RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz

RUN tar -xf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xf latest-ru_RU.tar.gz
RUN mv ./phpMyAdmin-4.9.0.1-all-languages /var/www/localhost/phpMyAdmin
RUN mv ./wordpress /var/www/localhost/wordpress
RUN mkdir /var/www/localhost/nginx
RUN mv /var/www/localhost/index.nginx-debian.html var/www/localhost/nginx/index.nginx-debian.html

COPY ./srcs/config.inc.php ./var/www/localhost/phpMyAdmin/config.inc.php
COPY ./srcs/wp-config.php ./var/www/localhost/wordpress
COPY ./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY ./srcs/server.sh /
COPY ./srcs/create_data_base.sh /

RUN bash create_data_base.sh
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled
RUN rm -rf /etc/nginx/sites-enabled/default
RUN rm -rf latest-ru_RU.tar.gz
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/ssl.key \
    -out /etc/ssl/certs/ssl.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=psnapp"
CMD bash server.sh
