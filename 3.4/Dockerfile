FROM python:2.7

MAINTAINER Germán M. Podestá <german.podesta@devecoop.com>
ENV TRYTON_VERSION 3.4
ENV TRYTON_DIR /opt/tryton/

RUN pip install mercurial hgnested psycopg2

RUN mkdir -p ${TRYTON_DIR}
WORKDIR ${TRYTON_DIR}

RUN hg clone -u $TRYTON_VERSION -r 0 -b $TRYTON_VERSION http://hg.tryton.org/trytond
RUN pip install -e ${TRYTON_DIR}/trytond

# Copy trytond.conf from local folder to /etc/trytond.conf
ADD trytond.conf ${TRYTON_DIR}/trytond.conf
RUN ln -s ${TRYTON_DIR}/trytond.conf /etc/trytond.conf

# Create an empty folder for tryton data store
RUN mkdir -p /var/lib/trytond

EXPOSE 	8000
CMD ["-v"]
ENTRYPOINT ["/usr/local/bin/trytond", "-c", "/etc/trytond.conf"]
