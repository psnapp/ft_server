service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'psnapp'@'localhost' IDENTIFIED BY 'psnapp';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'psnapp'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
