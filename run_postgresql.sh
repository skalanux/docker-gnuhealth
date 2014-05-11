#!/bin/sh

if [ -d /var/run/postgresql ]; then
    chmod 2775 /var/run/postgresql
else
    install -d -m 2775 -o postgres -g postgres /var/run/postgresql
fi

chmod 2775 /opt/gnuhealth/gnuhealth/tryton/server/trytond-*/etc/trytond.conf
chown gnuhealth:gnuhealth /opt/gnuhealth/gnuhealth/tryton/server/trytond-*/etc/trytond.conf
exec su postgres -c "/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf"

