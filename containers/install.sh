apt update
apt install -y git
apt install -y zip
apt install -y php-common
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
cd /src/chefme
ls -la
composer update -W
# php composer.phar update
php -S 0.0.0.0:8000 -t /src/chefme