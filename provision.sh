#!/usr/bin/env bash

set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

# Copy the sites to the nginx directory
sudo cp /var/www/html/default /etc/nginx/sites-available

# Import the configuration file
source /var/www/html/config.cfg

# Add our site routes to the virtual /etc/hosts file
echo "127.0.1.1 $site_web" | sudo tee -a /etc/hosts

# Edit the server config to update the web / api server
sed -i -e "s/site_web/$site_web/g" /etc/nginx/sites-available/default

# Enable the site
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Setup redbean database if it doesn't exist
RESULT=`mysql -u$mysql_user -p$mysql_pass --skip-column-names -e "SHOW DATABASES LIKE '$database_name'"`
if [ "$RESULT" == "$database_name" ]; then
    echo "Database exists, moving on..."
else
    echo "Creating database..."
    mysql -u$mysql_user -p$mysql_pass -e "create database $database_name"
fi

# Restart the nginx service to show enabled sites
sudo service nginx restart
