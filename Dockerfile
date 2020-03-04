FROM ubuntu:18.04

COPY apt.conf /etc/apt/
COPY requirements.txt /install/requirements.txt
WORKDIR /install
RUN \
#==================================================
# Python3.6
#==================================================
  apt-get update && \
  apt-get -qqy --no-install-recommends install \
    curl \
    python3.6 \
    python3-pip \
    python3-setuptools \
    supervisor \
    libltdl-dev \
    python3-psycopg2 \
    inetutils-ping && \
#==================================================
# Python Packages
#==================================================
  pip3 install --proxy 3.20.128.5:88 --no-cache-dir -r requirements.txt && \
#==================================================
# apt clean
#==================================================
  apt-get clean && rm -rf /var/lib/apt/lists/*

