# pull official base image
#FROM python:3.11.4-slim-buster
FROM python:3.8-slim

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get clean 
RUN apt-get upgrade -y && \
apt-get install --no-install-recommends -y \
wget \
git \
gcc \
binutils \
cron \
gunicorn \
libreoffice \
postgis \
postgresql-client \
inetutils-ping \
iproute2 \
net-tools \
#libproj-dev \
#gdal-bin \
#libgdal-dev \
#nginx \
vim \
bzip2 \
curl \
npm \
procps


# set work directory
WORKDIR /usr/src/app
#RUN mkdir -p $WORKDIR

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .
COPY ./default_urlconf_2.html /usr/local/lib/python3.8/site-packages/django/views/templates/default_urlconf.html

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

