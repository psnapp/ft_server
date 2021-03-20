chown -R www-data /var/www/*
chmod -R 755 var/www/*

service nginx start
service mysql start
service php7.3-fpm start
bash
