#!/bin/bash

apt install -y apache2

cp ../ApacheConfFiles/apache2.conf /etc/apache2/

#enable websites
for i in $(ls ../ApacheConfFiles/tim.*) ; do
    cp $i /etc/apache2/sites-available
    shortname=$(basename $i)
    mkdir /var/www/$(echo $shortname | sed 's/.conf//')
    a2ensite $shortname
done

apachectl configtest
systemctl restart apache2

