# pull official base image
#FROM python:3.11.4-slim-buster
FROM python:3.8-slim

RUN apt-get update && apt-get install -y software-properties-common

RUN apt-get clean && \
apt-get upgrade -y && \
apt-get install --no-install-recommends -y \
wget \
git \
gcc \
binutils \
cron \
#nginx \
gunicorn \
libreoffice \
postgresql-client \
vim \
bzip2 \
curl \
npm


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

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

