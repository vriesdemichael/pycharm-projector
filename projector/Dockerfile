FROM centos:8

EXPOSE 8887

USER root

ARG version="2021.3.1"
ARG community_or_professional="professional"

# Download Pycharm
ADD "https://download.jetbrains.com/python/pycharm-${community_or_professional}-${version}.tar.gz" /opt
RUN tar -xf /opt/*.tar.gz --directory /opt

# Add a predictable softlink for the projector config
RUN ln -s "/opt/pycharm-$version" "/opt/pycharm-latest"


RUN yum update -y && \
    yum install -y python3 python3-pip python3-pyOpenSSL python3-cryptography \
                   less libXext libXrender libXtst libXi freetype && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    echo "Done"

RUN python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install projector-installer

# optional as separate config file mounted here
COPY config.ini /root/.projector/configs/PyCharm/config.ini
COPY start.sh /opt/start.sh

CMD /opt/start.sh
