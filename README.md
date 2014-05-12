docker-gnuhealth
================

GnuHealth Docker

Docker container file for GnuHealth. Uses the HG Source Repository to pull in the latest version of GnuHealth. http://health.gnu.org/
The dockerfile is currently configured to download stable. However can also be used to download default branch.

Build using inside the git folder after cloning repository

sudo docker build -t="gnuhealth" .

run using

sudo docker run -d -t gnuhealth

view the logs by

sudo docker ps -a 

from the containerid

sudo docker logs <containerid>
