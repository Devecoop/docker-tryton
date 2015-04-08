# Trytond 3.2
#
# VERSION	3.2.1.0

FROM ubuntu:14.04
MAINTAINER Germán M. Podestá <german.podesta@devecoop.com>

# Setup environment and UTF-8 locale
ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV TRYTON_DIR /opt/tryton/

# Install setuptools to install pip
RUN apt-get update && \
    apt-get -y -q --no-install-recommends \
    install python-setuptools python-lxml unoconv mercurial

# setuptools sucks! install pip
RUN easy_install pip

RUN mkdir -p ${TRYTON_DIR}

# Install latest trytond in 3.2.x series
RUN pip install --src ${TRYTON_DIR} -e "hg+http://hg.tryton.org/trytond/@3.2#egg=trytond"

# Copy trytond.conf from local folder to /etc/trytond.conf
ADD trytond.conf ${TRYTON_DIR}/trytond.conf
RUN ln -s ${TRYTON_DIR}/trytond.conf /etc/trytond.conf

# Create an empty folder for tryton data store
RUN mkdir -p /var/lib/trytond

# Intiialise the database
RUN echo admin > /.trytonpassfile
ENV TRYTONPASSFILE /.trytonpassfile


EXPOSE 	8000
CMD ["-v"]
ENTRYPOINT ["/usr/local/bin/trytond"]
