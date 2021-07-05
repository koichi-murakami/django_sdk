#
# Dockerfile for Python Development
#
FROM ubuntu:latest
LABEL maintener="Koichi Murakami <koichi.murakami@kek.jp>"

ENV DEBIAN_FRONTEND nointeractive
ENV TZ Asia/Tokyo

#
RUN apt-get update && \
    apt-get install -y tcsh zsh sudo vim git less pip tzdata && \
    apt-get install -y libsasl2-dev libldap2-dev libpq-dev && \
    apt-get install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

#
ADD ./Pipfile /
ADD ./Pipfile.lock /
RUN pip install --upgrade pip && pip install pipenv
RUN pipenv install --deploy --system --dev

#
RUN apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

#
WORKDIR /
