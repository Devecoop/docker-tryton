# Trytond 3.2 with Sale module and Postgres
#
# VERSION	3.2.0.1

FROM devecoop/tryton-postgres:3.2
MAINTAINER Germán Podestá <german.podesta@devecoop.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    swig make git mercurial libreoffice-java-common unoconv ssl-cert ca-certificates

RUN pip install 'trytond_sale>=3.2,<3.3'

ADD trytond.conf ${TRYTON_DIR}/trytond.conf
ADD argentina-modules.txt ${TRYTON_DIR}/argentina-modules.txt
ADD my-modules.txt ${TRYTON_DIR}/my-modules.txt
