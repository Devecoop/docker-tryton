# Trytond 3.2 with Sale module and Postgres
#
# VERSION	3.2.0.1

FROM devecoop/tryton-postgres:3.2
MAINTAINER Germán Podestá <german.podesta@devecoop.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    swig make git mercurial libreoffice-java-common unoconv ssl-cert ca-certificates

ADD requirements.txt ${TRYTON_DIR}
RUN pip install -r ${TRYTON_DIR}/requirements.txt

ADD trytond.conf ${TRYTON_DIR}
ADD modules.json ${TRYTON_DIR}

RUN pip install vcstools

ADD get_modules.py ${TRYTON_DIR}

ADD docker-entrypoint.sh /

CMD ["trytond", "-v"]
ENTRYPOINT ["/docker-entrypoint.sh"]
