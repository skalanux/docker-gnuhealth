#from wiltan/debian-tiny
from ubuntu:latest
add https://github.com/Billynkid/docker-gnuhealth/blob/master/requires /tmp/
run apt-get update 
run apt-get -y --force-yes install python-setuptools python-dev libldap2-dev libsasl2-dev git
run easy_install pip
run pip install hgnested
run mkdir -p /etc/mercurial/
run echo "[extensions]\nhgnested =" > /etc/mercurial/hgrc
run hg clone http://hg.savannah.gnu.org/hgweb/health/ /opt/gnuhealth/
run pip install -r /tmp/requires
# tryton end
run sed -i s/localhost:8000/0.0.0.0:8000/g /opt/gnuhealth/etc/trytond.conf
run rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
add run_postgresql.sh /usr/local/bin/
add supervisor/	/etc/supervisor/conf.d/
expose 8000
