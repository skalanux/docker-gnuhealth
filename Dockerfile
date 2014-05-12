#from wiltan/debian-tiny
from ubuntu:latest
add requires /tmp/
run apt-get update 
run apt-get -y install python-setuptools python-dev libldap2-dev libsasl2-dev git libsasl2-dev libssl-dev python-ldap python-psycopg2 libxml2-dev libxslt1-dev wget libpq-dev postgresql supervisor
run easy_install pip
run pip install hgnested
run mkdir -p /etc/mercurial/
run echo "[extensions]\nhgnested =" > /etc/mercurial/hgrc
run mkdir /tmp/gnuhealth
run hg clone http://hg.savannah.gnu.org/hgweb/health/ -r stable /tmp/gnuhealth/
run useradd -m -d /opt/gnuhealth gnuhealth
USER gnuhealth
ENV HOME /opt/gnuhealth
workdir /tmp/gnuhealth/tryton
run ./gnuhealth_install.sh
#run pip install -r /tmp/requires
# tryton end
#run source $HOME/.gnuhealthrc
workdir /opt/gnuheealth/gnuhealth/tryton/server/trytond-3.0.4/etc
run sed -i s/localhost:8000/0.0.0.0:8000/g $HOME/gnuhealth/tryton/server/trytond-*/etc/trytond.conf
USER root
run rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
add run_postgresql.sh /usr/local/bin/
run chmod +x /usr/local/bin/run_postgresql.sh
run service postgresql start
USER postgres
RUN /etc/init.d/postgresql start && psql --command "CREATE USER gnuhealth WITH CREATEDB;"
USER root
run service postgresql stop
add supervisor/	/etc/supervisor/conf.d/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
expose 8000
CMD ["/usr/bin/supervisord"]

