# Trytond 3.2 with Sale module and Postgres
#
# VERSION	3.2.0.1

FROM devecoop/tryton-base:3.2
MAINTAINER Germán Podestá <german.podesta@devecoop.com>

# Setup psycopg2 since you want to connect to postgres
# database
RUN apt-get -y -q install python-dev libpq-dev
RUN pip install psycopg2

# Setup the sale module since it is a required for this
# custom setup
RUN pip install 'trytond_sale>=3.2,<3.3'

# Copy new trytond.conf from local folder to /etc/trytond.conf
# The new trytond also has credentials to connect to the postgres
# server which is accessible elsewhere
ADD trytond.conf /etc/trytond.conf
