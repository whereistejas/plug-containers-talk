ARG OS_VERSION=31
ARG PYTHON_VER=python3
ARG FLASK_VER="flask==1.1.1"

ARG URL1=https://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png
ARG URL2=https://fedoraproject.org/w/uploads/2/2d/Logo_fedoralogo.png
ARG URL3=https://upload.wikimedia.org/wikipedia/en/2/22/Heckert_GNU_white.svg

ARG WEBAPP_FOLDER=/var/webapp/
ARG IMAGE_FOLDER=/var/webapp/images

FROM fedora:${OS_VERSION}
RUN dnf clean all
RUN dnf install -y wget

RUN dnf install -y ${PYTHON_VER}
RUN dnf install -y ${PYTHON_VER}-pip
RUN pip install ${FLASK_VER}

WORKDIR ${WEBAPP_FOLDER}
COPY flash-app/ ${WEBAPP_FOLDER}

WORKDIR ${IMAGE_FOLDER}
RUN wget -O img1.png ${URL1}
RUN wget -O img2.png ${URL2}
RUN wget -O img3.svg ${URL3}

WORKDIR ${WEBAPP_FOLDER}
ENV FLASK_APP=${WEBAPP_FOLDER}/main.py
ENTRYPOINT python3 -m flask run
