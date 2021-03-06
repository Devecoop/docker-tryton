FROM python:2.7

MAINTAINER Germán M. Podestá <german.podesta@devecoop.com>
ENV TRYTON_VERSION 3.4
ENV TRYTON_DIR /opt/tryton/

WORKDIR ${TRYTON_DIR}

RUN apt-get update && \
    apt-get install --no-install-recommends -y -q \
    libldap2-dev libsasl2-dev

RUN pip install mercurial hgnested

ADD requirements.txt ${TRYTON_DIR}
RUN pip install -r ${TRYTON_DIR}/requirements.txt

RUN mkdir -p ${TRYTON_DIR}

RUN echo "[extensions]" > /root/.hgrc && \
    echo "hgnested =" >> /root/.hgrc
RUN hg nclone http://hg.tryton.org/${TRYTON_VERSION}/trytond
RUN cd ${TRYTON_DIR}/trytond && \
    hg nupdate ${TRYTON_VERSION}
RUN pip install -e ${TRYTON_DIR}/trytond

# Copy trytond.conf from local folder to /etc/trytond.conf
ADD trytond.conf ${TRYTON_DIR}/trytond.conf
RUN ln -s ${TRYTON_DIR}/trytond.conf /etc/trytond.conf

# Create an empty folder for tryton data store
RUN mkdir -p /var/lib/trytond

EXPOSE 	8000
CMD ["-v"]
ENTRYPOINT ["/usr/local/bin/trytond", "-c", "/etc/trytond.conf"]
