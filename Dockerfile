FROM ubuntu:focal

USER root

ARG version="2021.3.1"
ARG community_or_professional="professional"

RUN apt-get update && \
    apt-get install -y software-properties-common &&\
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
            xorg \
            openssh-server \
            xauth \
            curl \
            # openjdk-7-jre \
            python3.6 python3.6-dev python3.6-venv \
            # python3.7 python3.7-dev python3.7-venv \
            # python3.8 python3.8-dev python3.8-venv \
            # python3.9 python3.9-dev python3.9-venv \
            # python3.10 python3.10-dev python3.10-venv \
            # python3.11 python3.11-dev python3.11-venv \
            --no-install-recommends \
     && rm -rf /var/lib/apt/lists/*

RUN python3.6 -m ensurepip --upgrade && python3.6 -m pip install --upgrade pip setuptools wheel
    # python3.7 -m pip install --upgrade pip setuptools wheel && \
    # python3.8 -m pip install --upgrade pip setuptools wheel && \
    # python3.9 -m pip install --upgrade pip setuptools wheel && \
    # python3.10 -m pip install --upgrade pip setuptools wheel && \
    # python3.11 -m pip install --upgrade pip setuptools wheel

# Download Pycharm
ADD "https://download.jetbrains.com/python/pycharm-${community_or_professional}-${version}.tar.gz" /opt
# RUN curl "https://download.jetbrains.com/python/pycharm-${community_or_professional}-${version}.tar.gz" \
#     | tar -xz --directory /opt && \
#     ln -s "/opt/pycharm-community-$version/bin/pycharm.sh" /usr/bin/pycharm

# if [ ! -f /tmp/pycharm.tar.gz ]; then
#     wget -O /tmp/pycharm.tar.gz "https://download.jetbrains.com/python/pycharm-community-$version.tar.gz"
# fi
#
# # Decompress Pycharm
# tar -xf /tmp/pycharm.tar.gz --directory /opt
#
# # Get rid of existing symlink that points to now-obsolete version
# if [ -f /usr/bin/pycharm ]; then
#     rm /usr/bin/pycharm
# fi

# Create a symlink. Now you can run pycharm on the command line and
# on the first run, it will create a start menu shortcut and such
# ln -s "/opt/pycharm-community-$version/bin/pycharm.sh" /usr/bin/pycharm

CMD ["sleep", "infinity"]


#
# USER root
#
# RUN yum update && \
#     yum -y install xterm xorg-x11-xauth xorg-x11-x11-utils && \
#     # yum -y clean all && \
#     rm -rf /var/cache/yum
#
#
# CMD sshd
