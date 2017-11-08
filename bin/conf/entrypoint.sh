#!/bin/bash

cd /var/www/htdocs/example

composer.phar self-update
composer.phar install

npm install

chown -R www-data:www-data /var/www/htdocs/example/public
chmod -R a+rw /var/www/htdocs/example/public

cp -R /var/www/htdocs/dist /var/www/htdocs/example/public/lib/vendor/hipay/hipay-fullservice-sdk-js
mv /var/www/htdocs/example/node_modules /var/www/htdocs/example/public/lib/vendor/node_modules

################################################################################
# IF CONTAINER IS KILLED, REMOVE PID
################################################################################
if [ -f /var/run/apache2/apache2.pid ]; then
rm -f /var/run/apache2/apache2.pid
fi

exec apache2-foreground


echo ""
echo "Setup completed! Do not forget to add your HiPay Fullservice credentials into the example/credentials.php file."
